import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/breakpoints.dart';
import '../../../core/theme/app_colors.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../shared/widgets/responsive_layout.dart';

class FeaturedProgram {
  final String titleKey;
  final String descKey;
  final IconData icon;
  final double progress;
  const FeaturedProgram(this.titleKey, this.descKey, this.icon, this.progress);
}

const List<FeaturedProgram> kFeaturedPrograms = [
  FeaturedProgram('fpDharmaTitle', 'fpDharmaDesc', Icons.school, 0.72),
  FeaturedProgram(
      'fpNarayanTitle', 'fpNarayanDesc', Icons.health_and_safety, 0.58),
  FeaturedProgram(
      'fpEducationTitle', 'fpEducationDesc', Icons.emergency_share, 0.85),
];

// Resolves a translated string from AppLocalizations using its field name
// as a string key. Keeps FeaturedProgram data-driven without hardcoding
// three separate switch statements.
String _t(AppLocalizations l10n, String key) {
  switch (key) {
    case 'fpDharmaTitle':
      return l10n.fpDharmaTitle;
    case 'fpDharmaDesc':
      return l10n.fpDharmaDesc;
    case 'fpNarayanTitle':
      return l10n.fpNarayanTitle;
    case 'fpNarayanDesc':
      return l10n.fpNarayanDesc;
    case 'fpEducationTitle':
      return l10n.fpEducationTitle;
    case 'fpEducationDesc':
      return l10n.fpEducationDesc;
    default:
      return key;
  }
}

class FeaturedProgramsSection extends StatelessWidget {
  const FeaturedProgramsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = Breakpoints.isMobile(width);
    final isTablet = Breakpoints.isTablet(width);
    final columns = isMobile ? 1 : (isTablet ? 2 : 3);
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: ContentContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(l10n.featuredProgramsHeading,
                style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 12),
            Text(
              l10n.featuredProgramsSubheading,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 48),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: kFeaturedPrograms.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                childAspectRatio: isMobile ? 1.3 : 0.95,
              ),
              itemBuilder: (context, index) {
                final program = kFeaturedPrograms[index];
                return _ProgramCard(program: program, l10n: l10n)
                    .animate()
                    .fadeIn(delay: (index * 120).ms, duration: 500.ms)
                    .slideY(begin: 0.15, end: 0);
              },
            ),
            const SizedBox(height: 32),
            TextButton(
              onPressed: () => context.go('/programs'),
              child: Text('${l10n.viewAllPrograms}  →'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProgramCard extends StatelessWidget {
  final FeaturedProgram program;
  final AppLocalizations l10n;
  const _ProgramCard({required this.program, required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(program.icon, color: AppColors.primary, size: 26),
          ),
          const SizedBox(height: 20),
          Text(_t(l10n, program.titleKey),
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          Expanded(
            child: Text(_t(l10n, program.descKey),
                style: Theme.of(context).textTheme.bodyMedium),
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: program.progress,
              minHeight: 6,
              backgroundColor: AppColors.divider,
              valueColor: const AlwaysStoppedAnimation(AppColors.accent),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.percentFunded((program.progress * 100).toInt()),
            style:
                const TextStyle(fontSize: 12, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
