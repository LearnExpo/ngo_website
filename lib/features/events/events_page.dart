import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ngo_website/shared/widgets/wrapper.dart';
import '../../core/constants/breakpoints.dart';
import '../../core/localization/localized_text.dart';
import '../../core/theme/app_colors.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../shared/widgets/page_scaffold.dart';
import '../../shared/widgets/responsive_layout.dart';

class NgoEvent {
  final String id;
  final LocalizedText title;
  final String date;
  final LocalizedText location;
  final LocalizedText description;
  final bool isUpcoming;
  const NgoEvent(this.id, this.title, this.date, this.location,
      this.description, this.isUpcoming);
}

const List<NgoEvent> kEvents = [
  // Upcoming events
  NgoEvent(
    'narayan-seva-food-distribution',
    {
      'en': 'Narayan Seva Food Distribution',
      'hi': 'नारायण सेवा अन्न वितरण',
    },
    'Aug 16, 2026',
    {
      'en': 'Community Center',
      'hi': 'सामुदायिक केंद्र',
    },
    {
      'en':
          'Volunteers come together to serve food and provide essential support to families and individuals facing hardship.',
      'hi':
          'स्वयंसेवक एक साथ मिलकर जरूरतमंद परिवारों और कठिन परिस्थितियों से गुजर रहे लोगों को भोजन एवं आवश्यक सहायता प्रदान करते हैं।',
    },
    true,
  ),

  NgoEvent(
    'dharma-temple-protection-seva',
    {
      'en': 'Dharma & Temple Protection Seva',
      'hi': 'धर्म एवं मंदिर संरक्षण सेवा',
    },
    'Aug 30, 2026',
    {
      'en': 'Community Temple',
      'hi': 'सामुदायिक मंदिर',
    },
    {
      'en':
          'Join us in supporting temple protection, preserving Sanatan religious heritage, and strengthening community participation in seva.',
      'hi':
          'मंदिर संरक्षण, सनातन धार्मिक विरासत को सुरक्षित रखने और सेवा में सामुदायिक भागीदारी को मजबूत करने के लिए हमारे साथ जुड़ें।',
    },
    true,
  ),

  NgoEvent(
    'education-support-seva',
    {
      'en': 'Education Support Seva',
      'hi': 'शिक्षा सहायता सेवा',
    },
    'Sep 13, 2026',
    {
      'en': 'Local Community School',
      'hi': 'स्थानीय सामुदायिक विद्यालय',
    },
    {
      'en':
          'Help children from economically weaker families with study materials and educational assistance so they can continue their learning.',
      'hi':
          'आर्थिक रूप से कमजोर परिवारों के बच्चों को अध्ययन सामग्री और शैक्षिक सहायता प्रदान कर उनकी शिक्षा जारी रखने में सहयोग करें।',
    },
    true,
  ),

  NgoEvent(
    'blanket-clothing-seva',
    {
      'en': 'Blanket & Clothing Seva',
      'hi': 'कंबल एवं वस्त्र सेवा',
    },
    'Oct 4, 2026',
    {
      'en': 'Community Outreach Center',
      'hi': 'सामुदायिक सेवा केंद्र',
    },
    {
      'en':
          'A community seva initiative providing clothing, blankets, and essential items to families and individuals in need.',
      'hi':
          'जरूरतमंद परिवारों और लोगों को वस्त्र, कंबल एवं आवश्यक सामग्री उपलब्ध कराने की सामुदायिक सेवा पहल।',
    },
    true,
  ),

  // Past events
  NgoEvent(
    'community-seva-meet',
    {
      'en': 'Community Seva Meet',
      'hi': 'सामुदायिक सेवा मिलन',
    },
    'Jul 19, 2026',
    {
      'en': 'Community Hall',
      'hi': 'सामुदायिक भवन',
    },
    {
      'en':
          'A community gathering focused on seva, volunteer participation, and supporting families in need.',
      'hi':
          'सेवा, स्वयंसेवक सहभागिता और जरूरतमंद परिवारों की सहायता पर केंद्रित एक सामुदायिक मिलन।',
    },
    false,
  ),

  NgoEvent(
    'education-assistance-drive',
    {
      'en': 'Education Assistance Drive',
      'hi': 'शिक्षा सहायता अभियान',
    },
    'Jun 21, 2026',
    {
      'en': 'Local Community School',
      'hi': 'स्थानीय सामुदायिक विद्यालय',
    },
    {
      'en':
          'Study materials and educational assistance were provided to children from economically weaker families.',
      'hi':
          'आर्थिक रूप से कमजोर परिवारों के बच्चों को अध्ययन सामग्री और शैक्षिक सहायता प्रदान की गई।',
    },
    false,
  ),

  NgoEvent(
    'narayan-seva-outreach',
    {
      'en': 'Narayan Seva Outreach',
      'hi': 'नारायण सेवा सहायता अभियान',
    },
    'May 17, 2026',
    {
      'en': 'Community Outreach Center',
      'hi': 'सामुदायिक सेवा केंद्र',
    },
    {
      'en':
          'Food, clothing, and essential support were provided to families and individuals facing hardship.',
      'hi':
          'कठिन परिस्थितियों का सामना कर रहे परिवारों और लोगों को भोजन, वस्त्र एवं आवश्यक सहायता प्रदान की गई।',
    },
    false,
  ),
];

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  final Set<String> _rsvpedEventIds = {};

  Future<void> _openRsvpDialog(
      NgoEvent event, AppLocalizations l10n, Locale locale) async {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => ComingSoonWrapper(
        enabled: true,
        child: AlertDialog(
          title: Text(l10n.rsvpDialogTitle(event.title.resolve(locale))),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: l10n.rsvpNameLabel),
                  validator: (val) => (val == null || val.trim().isEmpty)
                      ? l10n.rsvpNameLabel
                      : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: l10n.rsvpEmailLabel),
                  validator: (val) {
                    if (val == null || val.trim().isEmpty)
                      return l10n.rsvpEmailLabel;
                    if (!val.contains('@') || !val.contains('.'))
                      return l10n.rsvpEmailLabel;
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: Text(l10n.rsvpCancelBtn),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  Navigator.of(dialogContext).pop(true);
                }
              },
              child: Text(l10n.rsvpConfirmBtn),
            ),
          ],
        ),
      ),
    );

    nameController.dispose();
    emailController.dispose();

    if (confirmed == true && mounted) {
      setState(() => _rsvpedEventIds.add(event.id));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.rsvpSuccessSnackbar)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = Breakpoints.isMobile(width);
    final upcoming = kEvents.where((e) => e.isUpcoming).toList();
    final past = kEvents.where((e) => !e.isUpcoming).toList();
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    return PageScaffold(
      title: 'Events | VHDRSS',
      description:
          'See upcoming and past VHDRSS events, from fundraisers to volunteer orientations.',
      body: ContentContainer(
        padding:
            EdgeInsets.symmetric(vertical: 100, horizontal: isMobile ? 16 : 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.eventsHeading,
                style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 12),
            Text(l10n.eventsSubheading,
                style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 40),
            Text(l10n.upcomingEvents,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 20),
            for (int i = 0; i < upcoming.length; i++)
              _EventCard(
                event: upcoming[i],
                l10n: l10n,
                isRsvped: _rsvpedEventIds.contains(upcoming[i].id),
                onRsvpTap: () => _openRsvpDialog(upcoming[i], l10n, locale),
              )
                  .animate()
                  .fadeIn(delay: (i * 100).ms, duration: 400.ms)
                  .slideX(begin: 0.05, end: 0),
            const SizedBox(height: 48),
            Text(l10n.pastEvents,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 20),
            for (final event in past)
              _EventCard(
                  event: event,
                  l10n: l10n,
                  isPast: true,
                  isRsvped: false,
                  onRsvpTap: () {}),
          ],
        ),
      ),
    );
  }
}

class _EventCard extends StatelessWidget {
  final NgoEvent event;
  final AppLocalizations l10n;
  final bool isPast;
  final bool isRsvped;
  final VoidCallback onRsvpTap;

  const _EventCard({
    required this.event,
    required this.l10n,
    required this.isRsvped,
    required this.onRsvpTap,
    this.isPast = false,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = Breakpoints.isMobile(width);
    final locale = Localizations.localeOf(context);

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
            Text(event.title.resolve(locale),
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.location_on,
                    size: 14, color: AppColors.textSecondary),
                const SizedBox(width: 4),
                Text(event.location.resolve(locale),
                    style: const TextStyle(
                        fontSize: 13, color: AppColors.textSecondary)),
              ],
            ),
            const SizedBox(height: 10),
            Text(event.description.resolve(locale),
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        );

    Widget rsvpButton() => isRsvped
        ? OutlinedButton.icon(
            onPressed: null,
            icon: const Icon(Icons.check_circle,
                size: 18, color: AppColors.success),
            label: Text(l10n.rsvpConfirmedLabel),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.success,
              side: const BorderSide(color: AppColors.success),
              disabledForegroundColor: AppColors.success,
            ),
          )
        : ElevatedButton(onPressed: onRsvpTap, child: Text(l10n.rsvpCta));

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
                  SizedBox(width: double.infinity, child: rsvpButton()),
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
                  rsvpButton(),
                ],
              ],
            ),
    );
  }
}
