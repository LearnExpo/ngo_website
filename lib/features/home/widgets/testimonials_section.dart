import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/breakpoints.dart';
import '../../../core/theme/app_colors.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../shared/widgets/responsive_layout.dart';

class Testimonial {
  final String quoteKey;
  final String name;
  final String roleKey;
  const Testimonial(this.quoteKey, this.name, this.roleKey);
}

const List<Testimonial> kTestimonials = [
  Testimonial(
    'testimonial1Quote',
    'Ramesh Kumar',
    'testimonial1Role',
  ),
  Testimonial(
    'testimonial2Quote',
    'Suresh Sharma',
    'testimonial2Role',
  ),
  Testimonial(
    'testimonial3Quote',
    'Sunita Devi',
    'testimonial3Role',
  ),
];

String _t(AppLocalizations l10n, String key) {
  switch (key) {
    case 'testimonial1Quote':
      return l10n.testimonial1Quote;
    case 'testimonial1Role':
      return l10n.testimonial1Role;
    case 'testimonial2Quote':
      return l10n.testimonial2Quote;
    case 'testimonial2Role':
      return l10n.testimonial2Role;
    case 'testimonial3Quote':
      return l10n.testimonial3Quote;
    case 'testimonial3Role':
      return l10n.testimonial3Role;
    default:
      return key;
  }
}

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = Breakpoints.isMobile(width);
    final isTablet = Breakpoints.isTablet(width);
    final columns = isMobile ? 1 : (isTablet ? 2 : 3);
    final l10n = AppLocalizations.of(context)!;

    return Container(
      color: AppColors.surfaceMuted,
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: ContentContainer(
        child: Column(
          children: [
            Text(l10n.testimonialsHeading,
                style: Theme.of(context).textTheme.displayMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: 48),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: kTestimonials.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                childAspectRatio: isMobile ? 1.4 : 1.1,
              ),
              itemBuilder: (context, index) {
                final t = kTestimonials[index];
                return _TestimonialCard(testimonial: t, l10n: l10n)
                    .animate()
                    .fadeIn(delay: (index * 120).ms, duration: 500.ms);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _TestimonialCard extends StatelessWidget {
  final Testimonial testimonial;
  final AppLocalizations l10n;
  const _TestimonialCard({required this.testimonial, required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
          color: AppColors.surface, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.format_quote, color: AppColors.accent, size: 32),
          const SizedBox(height: 12),
          Expanded(
            child: Text(_t(l10n, testimonial.quoteKey),
                style: Theme.of(context).textTheme.bodyMedium),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.primaryLight,
                child: Icon(Icons.person, color: Colors.white, size: 18),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(testimonial.name,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  Text(_t(l10n, testimonial.roleKey),
                      style: const TextStyle(
                          fontSize: 12, color: AppColors.textSecondary)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
