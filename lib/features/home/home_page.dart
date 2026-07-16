import 'package:flutter/material.dart';
import '../../shared/widgets/page_scaffold.dart';
import 'widgets/cta_banner_section.dart';
import 'widgets/featured_programs_section.dart';
import 'widgets/hero_section.dart';
import 'widgets/impact_stats_section.dart';
import 'widgets/testimonials_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: 'About Us | Hopeworks Foundation',
  description: "Learn about Hopeworks Foundation's mission, history, and the team delivering education, healthcare, and relief programs worldwide.",
      body: Column(
        children: [
          HeroSection(),
          ImpactStatsSection(),
          FeaturedProgramsSection(),
          TestimonialsSection(),
          CtaBannerSection(),
        ],
      ),
    );
  }
}
