import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/breakpoints.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/responsive_layout.dart';

class FeaturedProgram {
  final String title;
  final String description;
  final IconData icon;
  final double progress; // 0..1, funding/goal progress
  const FeaturedProgram(
      this.title, this.description, this.icon, this.progress);
}

const List<FeaturedProgram> kFeaturedPrograms = [
  FeaturedProgram(
    'Education Access',
    'Building classrooms and supplying learning materials for children in underserved regions.',
    Icons.school,
    0.72,
  ),
  FeaturedProgram(
    'Healthcare Outreach',
    'Mobile clinics and essential medicine delivery to remote communities.',
    Icons.health_and_safety,
    0.58,
  ),
  FeaturedProgram(
    'Disaster Relief',
    'Rapid-response emergency aid — food, water, and shelter after crises.',
    Icons.emergency_share,
    0.85,
  ),
];

class FeaturedProgramsSection extends StatelessWidget {
  const FeaturedProgramsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = Breakpoints.isMobile(width);
    final isTablet = Breakpoints.isTablet(width);
    final columns = isMobile ? 1 : (isTablet ? 2 : 3);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: ContentContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Our Programs',
                style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 12),
            Text(
              'Every donation and volunteer hour goes directly into one of these initiatives.',
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
                return _ProgramCard(program: program)
                    .animate()
                    .fadeIn(delay: (index * 120).ms, duration: 500.ms)
                    .slideY(begin: 0.15, end: 0);
              },
            ),
            const SizedBox(height: 32),
            TextButton(
              onPressed: () => context.go('/programs'),
              child: const Text('View All Programs  →'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProgramCard extends StatelessWidget {
  final FeaturedProgram program;
  const _ProgramCard({required this.program});

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
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(program.icon, color: AppColors.primary, size: 26),
          ),
          const SizedBox(height: 20),
          Text(program.title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          Expanded(
            child: Text(
              program.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
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
            '${(program.progress * 100).toInt()}% of goal funded',
            style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}