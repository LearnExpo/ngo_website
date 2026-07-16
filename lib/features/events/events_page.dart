import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/breakpoints.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/page_scaffold.dart';
import '../../shared/widgets/responsive_layout.dart';

class NgoEvent {
  final String title;
  final String date;
  final String location;
  final String description;
  final bool isUpcoming;
  const NgoEvent(
      this.title, this.date, this.location, this.description, this.isUpcoming);
}

const List<NgoEvent> kEvents = [
  NgoEvent(
      'Annual Charity Gala',
      'Sep 20, 2026',
      'New York, NY',
      'An evening of stories, live auction, and fundraising for our 2027 programs.',
      true),
  NgoEvent(
      'Volunteer Orientation Day',
      'Aug 12, 2026',
      'Online',
      'A virtual info session for anyone interested in volunteering with us.',
      true),
  NgoEvent(
      '5K Charity Run',
      'Oct 4, 2026',
      'Chicago, IL',
      'Run for a cause — proceeds go directly to our clean water initiative.',
      true),
  NgoEvent(
      'Spring Fundraiser Dinner',
      'Apr 18, 2026',
      'Austin, TX',
      'Our spring fundraiser raised over \$85,000 for education programs.',
      false),
  NgoEvent('Community Health Fair', 'Feb 2, 2026', 'Nairobi, Kenya',
      'Free checkups and health education reaching 1,200+ attendees.', false),
];

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final upcoming = kEvents.where((e) => e.isUpcoming).toList();
    final past = kEvents.where((e) => !e.isUpcoming).toList();

    return PageScaffold(
      title: 'Gallery | Hopeworks Foundation',
      description:
          "Photos from Hopeworks Foundation's programs around the world.",
      body: ContentContainer(
        padding: const EdgeInsets.symmetric(vertical: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Events', style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 12),
            Text('Join us in person or online.',
                style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 40),
            Text('Upcoming', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 20),
            for (int i = 0; i < upcoming.length; i++)
              _EventCard(event: upcoming[i])
                  .animate()
                  .fadeIn(delay: (i * 100).ms, duration: 400.ms)
                  .slideX(begin: 0.05, end: 0),
            const SizedBox(height: 48),
            Text('Past Events',
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 20),
            for (final event in past) _EventCard(event: event, isPast: true),
          ],
        ),
      ),
    );
  }
}

class _EventCard extends StatelessWidget {
  final NgoEvent event;
  final bool isPast;
  const _EventCard({required this.event, this.isPast = false});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = Breakpoints.isMobile(width);
    Widget dateBadge() => Container(
          width: isMobile ? double.infinity : 100,
          padding: const EdgeInsets.symmetric(vertical: 12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color:
                isPast ? AppColors.divider : AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            event.date,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: isPast ? AppColors.textSecondary : AppColors.primary,
            ),
          ),
        );

    Widget details() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(event.title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.location_on,
                    size: 14, color: AppColors.textSecondary),
                const SizedBox(width: 4),
                Text(event.location,
                    style: const TextStyle(
                        fontSize: 13, color: AppColors.textSecondary)),
              ],
            ),
            const SizedBox(height: 10),
            Text(event.description,
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        );

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isPast ? AppColors.surfaceMuted : AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                dateBadge(),
                const SizedBox(height: 16),
                details(),
                if (!isPast) ...[
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('RSVP')),
                  ),
                ],
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                dateBadge(),
                const SizedBox(width: 24),
                Expanded(child: details()),
                if (!isPast) ...[
                  const SizedBox(width: 20),
                  ElevatedButton(onPressed: () {}, child: const Text('RSVP')),
                ],
              ],
            ),
    );
  }
}
