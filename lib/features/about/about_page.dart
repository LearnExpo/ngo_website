import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/breakpoints.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/page_scaffold.dart';
import '../../shared/widgets/responsive_layout.dart';

class TeamMember {
  final String name;
  final String role;
  const TeamMember(this.name, this.role);
}

class Milestone {
  final String year;
  final String description;
  const Milestone(this.year, this.description);
}

const List<TeamMember> kTeam = [
  TeamMember('Sarah Connolly', 'Executive Director'),
  TeamMember('Michael Osei', 'Programs Director'),
  TeamMember('Lina Farouk', 'Head of Partnerships'),
  TeamMember('James Whitfield', 'Finance Director'),
];

const List<Milestone> kMilestones = [
  Milestone('2015',
      'Hopeworks founded with a single education program in rural Kenya.'),
  Milestone(
      '2017', 'Expanded to healthcare outreach with our first mobile clinic.'),
  Milestone('2019', 'Reached 10 countries and 5,000 beneficiaries.'),
  Milestone('2021', 'Launched rapid disaster-relief response teams.'),
  Milestone('2024', 'Surpassed 12,000 lives impacted and 45 active programs.'),
];

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = Breakpoints.isMobile(width);

    return PageScaffold(
      body: Column(
        children: [
          // --- Mission / Story ---
          ContentContainer(
            padding: const EdgeInsets.symmetric(vertical: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Our Story',
                        style: Theme.of(context).textTheme.displayMedium)
                    .animate()
                    .fadeIn(duration: 400.ms),
                const SizedBox(height: 20),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 760),
                  child: Text(
                    'Hopeworks Foundation started in 2015 with a single classroom in rural Kenya. '
                    'Today we run 45 programs across 18 countries, spanning education, healthcare, '
                    'clean water, and emergency relief. We believe lasting change happens when '
                    'communities lead and we support — every program is built with local partners '
                    'and designed to be sustainable long after our involvement ends.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(height: 40),
                isMobile
                    ?const Column(
                        children: [
                          _ValueCard(
                            icon: Icons.visibility,
                            title: 'Our Vision',
                            body:
                                'A world where every community has the resources and opportunity to thrive.',
                          ),
                           SizedBox(height: 20),
                          _ValueCard(
                            icon: Icons.flag,
                            title: 'Our Mission',
                            body:
                                'Deliver education, healthcare, and relief in partnership with local communities.',
                          ),
                        ],
                      )
                    : const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: _ValueCard(
                            icon: Icons.visibility,
                            title: 'Our Vision',
                            body:
                                'A world where every community has the resources and opportunity to thrive.',
                          )),
                          const SizedBox(width: 24),
                          Expanded(
                              child: _ValueCard(
                            icon: Icons.flag,
                            title: 'Our Mission',
                            body:
                                'Deliver education, healthcare, and relief in partnership with local communities.',
                          )),
                        ],
                      ),
              ],
            ),
          ),

          // --- Timeline ---
          Container(
            color: AppColors.surfaceMuted,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 80),
            child: ContentContainer(
              child: Column(
                children: [
                  Text('Our Journey',
                      style: Theme.of(context).textTheme.displayMedium),
                  const SizedBox(height: 48),
                  for (int i = 0; i < kMilestones.length; i++)
                    _TimelineRow(
                            milestone: kMilestones[i],
                            isLast: i == kMilestones.length - 1)
                        .animate()
                        .fadeIn(delay: (i * 100).ms, duration: 400.ms),
                ],
              ),
            ),
          ),

          // --- Team ---
          ContentContainer(
            padding: const EdgeInsets.symmetric(vertical: 80),
            child: Column(
              children: [
                Text('Meet the Team',
                    style: Theme.of(context).textTheme.displayMedium),
                const SizedBox(height: 48),
                Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  alignment: WrapAlignment.center,
                  children: [
                    for (final member in kTeam) _TeamCard(member: member),
                  ],
                ),
              ],
            ),
          ),

          // --- Annual reports ---
          Container(
            color: AppColors.surfaceMuted,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 60),
            child: ContentContainer(
              child: Column(
                children: [
                  Text('Transparency & Reports',
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 12),
                  Text(
                    'We publish an annual report every year detailing exactly how funds are used.',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.download, size: 18),
                    label: const Text('Download 2025 Annual Report'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ValueCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String body;
  const _ValueCard(
      {required this.icon, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primary, size: 28),
          const SizedBox(height: 12),
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(body, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class _TimelineRow extends StatelessWidget {
  final Milestone milestone;
  final bool isLast;
  const _TimelineRow({required this.milestone, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 70,
            child: Text(milestone.year,
                style: const TextStyle(
                    fontWeight: FontWeight.w700, color: AppColors.primary)),
          ),
          Column(
            children: [
              Container(
                width: 14,
                height: 14,
                decoration: const BoxDecoration(
                    color: AppColors.primary, shape: BoxShape.circle),
              ),
              if (!isLast)
                Expanded(child: Container(width: 2, color: AppColors.divider)),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Text(milestone.description,
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
          ),
        ],
      ),
    );
  }
}

class _TeamCard extends StatelessWidget {
  final TeamMember member;
  const _TeamCard({required this.member});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        children: [
          const CircleAvatar(
            radius: 48,
            backgroundColor: AppColors.primaryLight,
            child: Icon(Icons.person, color: Colors.white, size: 44),
          ),
          const SizedBox(height: 14),
          Text(member.name, style: Theme.of(context).textTheme.titleLarge),
          Text(member.role,
              style: const TextStyle(
                  color: AppColors.textSecondary, fontSize: 13)),
        ],
      ),
    );
  }
}
