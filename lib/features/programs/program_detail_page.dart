import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/breakpoints.dart';
import '../../core/theme/app_colors.dart';
import '../../data/programs_data.dart';
import '../../shared/widgets/page_scaffold.dart';
import '../../shared/widgets/responsive_layout.dart';

class ProgramDetailPage extends StatelessWidget {
  final String programId;
  const ProgramDetailPage({super.key, required this.programId});

  @override
  Widget build(BuildContext context) {
    final program = findProgramById(programId);
    final width = MediaQuery.of(context).size.width;
    final isMobile = Breakpoints.isMobile(width);

    Widget icon() => Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Icon(program!.icon, color: AppColors.primary, size: 36),
        );

    Widget titleBlock() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(program!.category,
                style: const TextStyle(
                    color: AppColors.primary, fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            Text(program.title,
                style: Theme.of(context).textTheme.displayMedium),
          ],
        );

    if (program == null) {
      return PageScaffold(
        title: '${program!.title} | Hopeworks Foundation',
        description: program.shortDescription,
        body: ContentContainer(
          padding: const EdgeInsets.symmetric(vertical: 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Program not found',
                  style: Theme.of(context).textTheme.displayMedium),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () => context.go('/programs'),
                child: const Text('Back to Programs'),
              ),
            ],
          ),
        ),
      );
    }

    return PageScaffold(
      title: '${program.title} | Hopeworks Foundation',
      description: program.shortDescription,
      body: ContentContainer(
        padding: const EdgeInsets.symmetric(vertical: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
              onPressed: () => context.go('/programs'),
              icon: const Icon(Icons.arrow_back, size: 16),
              label: const Text('All Programs'),
            ),
            const SizedBox(height: 20),
            isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      icon(),
                      const SizedBox(height: 16),
                      titleBlock()
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      icon(),
                      const SizedBox(width: 24),
                      Expanded(child: titleBlock())
                    ],
                  ),
            const SizedBox(height: 32),
            Text(program.longDescription,
                style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: AppColors.surfaceMuted,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${program.raisedAmount} raised',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: AppColors.primary)),
                      Text('Goal: ${program.goalAmount}',
                          style:
                              const TextStyle(color: AppColors.textSecondary)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: LinearProgressIndicator(
                      value: program.progress,
                      minHeight: 10,
                      backgroundColor: AppColors.divider,
                      valueColor:
                          const AlwaysStoppedAnimation(AppColors.accent),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => context.go('/donate'),
                    child: const Text('Support This Program'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
