import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/breakpoints.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/responsive_layout.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = Breakpoints.isMobile(width);

    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60 : 100,
      ),
      child: ContentContainer(
        child: Flex(
          direction: isMobile ? Axis.vertical : Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: isMobile ? 0 : 5,
              child: Column(
                crossAxisAlignment: isMobile
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  _Badge(),
                  const SizedBox(height: 20),
                  Text(
                    'Together, We\nRebuild Hope',
                    textAlign: isMobile ? TextAlign.center : TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.copyWith(fontSize: isMobile ? 38 : 56),
                  ).animate().fadeIn(duration: 500.ms).slideY(
                      begin: 0.15, end: 0, duration: 500.ms),
                  const SizedBox(height: 20),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 480),
                    child: Text(
                      'We deliver education, healthcare, and disaster relief '
                      'to communities that need it most — powered by donors '
                      'and volunteers like you.',
                      textAlign:
                          isMobile ? TextAlign.center : TextAlign.start,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ).animate().fadeIn(delay: 150.ms, duration: 500.ms),
                  const SizedBox(height: 32),
                  Wrap(
                    alignment:
                        isMobile ? WrapAlignment.center : WrapAlignment.start,
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => context.go('/donate'),
                        icon: const Icon(Icons.favorite, size: 18),
                        label: const Text('Donate Now'),
                      ),
                      OutlinedButton(
                        onPressed: () => context.go('/programs'),
                        child: const Text('See Our Programs'),
                      ),
                    ],
                  ).animate().fadeIn(delay: 300.ms, duration: 500.ms),
                ],
              ),
            ),
            if (!isMobile) const SizedBox(width: 40),
            if (!isMobile)
              Expanded(
                flex: 4,
                child: _HeroVisual(),
              ),
          ],
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.circle, size: 8, color: AppColors.success),
          SizedBox(width: 8),
          Text(
            '12,000+ lives impacted since 2015',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

/// Simple illustrative visual built from shapes/icons — no image assets
/// needed yet. Swap for real photography whenever you have it.
class _HeroVisual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: AppColors.heroGradient,
              borderRadius: BorderRadius.circular(32),
            ),
          ).animate().fadeIn(duration: 600.ms).scale(
              begin: const Offset(0.9, 0.9), end: const Offset(1, 1)),
          const Icon(Icons.volunteer_activism,
                  size: 140, color: Colors.white)
              .animate()
              .fadeIn(delay: 200.ms, duration: 500.ms),
        ],
      ),
    );
  }
}