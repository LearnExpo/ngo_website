import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/breakpoints.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/responsive_layout.dart';

class CtaBannerSection extends StatelessWidget {
  const CtaBannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = Breakpoints.isMobile(width);

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(gradient: AppColors.heroGradient),
      padding: const EdgeInsets.symmetric(vertical: 72),
      child: ContentContainer(
        child: Column(
          children: [
            Text(
              'Ready to Make a Difference?',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Colors.white,
                    fontSize: isMobile ? 28 : 36,
                  ),
            ),
            const SizedBox(height: 12),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Text(
                'Whether it\'s a one-time gift or your time as a volunteer, '
                'every contribution moves us closer to the communities that need it.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 16),
              ),
            ),
            const SizedBox(height: 32),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 16,
              runSpacing: 16,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.primary,
                  ),
                  onPressed: () => context.go('/donate'),
                  child: const Text('Donate Now'),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white, width: 1.5),
                  ),
                  onPressed: () => context.go('/volunteer'),
                  child: const Text('Become a Volunteer'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}