import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ngo_website/l10n/generated/app_localizations.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../core/constants/breakpoints.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/responsive_layout.dart';

class ImpactStat {
  final String value;
  final String label;
  final IconData icon;
  const ImpactStat(this.value, this.label, this.icon);
}

List<ImpactStat> buildImpactStats(AppLocalizations l10n) => [
      ImpactStat('12,000+', l10n.statLivesImpacted, Icons.groups),
      ImpactStat('45', l10n.statProgramsDelivered, Icons.diversity_3),
      ImpactStat('4', l10n.statCountriesReached, Icons.public),
      ImpactStat('₹2.4M', l10n.statFundsRaised, Icons.savings),
    ];

class ImpactStatsSection extends StatefulWidget {
  const ImpactStatsSection({super.key});

  @override
  State<ImpactStatsSection> createState() => _ImpactStatsSectionState();
}

class _ImpactStatsSectionState extends State<ImpactStatsSection> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = Breakpoints.isMobile(width);

    return VisibilityDetector(
      key: const Key('impact-stats-section'),
      onVisibilityChanged: (info) {
        if (!_visible && info.visibleFraction > 0.2) {
          setState(() => _visible = true);
        }
      },
      child: Container(
        color: AppColors.surfaceMuted,
        padding: const EdgeInsets.symmetric(vertical: 56),
        child: ContentContainer(
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            runSpacing: 32,
            children: [
              for (final stat
                  in buildImpactStats(AppLocalizations.of(context)!))
                SizedBox(
                  width: isMobile ? (width - 80) / 2 : 220,
                  child: _StatCard(stat: stat, animate: _visible),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final ImpactStat stat;
  final bool animate;
  const _StatCard({required this.stat, required this.animate});

  @override
  Widget build(BuildContext context) {
    final numeric = RegExp(r'[\d.]+').firstMatch(stat.value)?.group(0) ?? '0';
    final target = double.tryParse(numeric) ?? 0;
    final prefix = stat.value.substring(0, stat.value.indexOf(numeric));
    final suffix =
        stat.value.substring(stat.value.indexOf(numeric) + numeric.length);
    final isDecimal = numeric.contains('.');

    return Column(
      children: [
        Icon(stat.icon, color: AppColors.primary, size: 32),
        const SizedBox(height: 12),
        TweenAnimationBuilder<double>(
          // Starts at 0, only counts up to `target` once `animate` flips true
          // (i.e. once this section has scrolled into view).
          tween: Tween(begin: 0, end: animate ? target : 0),
          duration: const Duration(milliseconds: 1400),
          curve: Curves.easeOutCubic,
          builder: (context, value, child) {
            final display = isDecimal
                ? value.toStringAsFixed(1)
                : value.toStringAsFixed(0).replaceAllMapped(
                    RegExp(r'\B(?=(\d{3})+(?!\d))'), (m) => ',');
            return Text(
              '$prefix$display$suffix',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                  ),
            );
          },
        ),
        const SizedBox(height: 6),
        Text(
          stat.label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.2, end: 0);
  }
}
