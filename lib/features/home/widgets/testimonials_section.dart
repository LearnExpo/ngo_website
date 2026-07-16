import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/breakpoints.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/responsive_layout.dart';

class Testimonial {
  final String quote;
  final String name;
  final String role;
  const Testimonial(this.quote, this.name, this.role);
}

const List<Testimonial> kTestimonials = [
  Testimonial(
    'The mobile clinic reached our village when we had nowhere else to turn. '
    'My daughter got the care she needed within hours.',
    'Amara N.',
    'Program Beneficiary, Kenya',
  ),
  Testimonial(
    'Volunteering here changed how I see impact — every hour genuinely reaches someone.',
    'Daniel R.',
    'Volunteer, 2 years',
  ),
  Testimonial(
    'Transparent reporting made it easy to trust where my monthly donation goes.',
    'Priya S.',
    'Monthly Donor',
  ),
];

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = Breakpoints.isMobile(width);
    final isTablet = Breakpoints.isTablet(width);
    final columns = isMobile ? 1 : (isTablet ? 2 : 3);

    return Container(
      color: AppColors.surfaceMuted,
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: ContentContainer(
        child: Column(
          children: [
            Text('Voices From Our Community',
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
                return _TestimonialCard(testimonial: t)
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
  const _TestimonialCard({required this.testimonial});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.format_quote, color: AppColors.accent, size: 32),
          const SizedBox(height: 12),
          Expanded(
            child: Text(
              testimonial.quote,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
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
                  Text(testimonial.role,
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