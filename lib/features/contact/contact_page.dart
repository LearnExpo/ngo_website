import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ngo_website/l10n/generated/app_localizations.dart';
import '../../core/constants/breakpoints.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/page_scaffold.dart';
import '../../shared/widgets/responsive_layout.dart';

import 'dart:ui_web' as ui_web;

import 'package:web/web.dart' as web;

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();
  bool _submitted = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _submitted = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = Breakpoints.isMobile(width);
    final l10n = AppLocalizations.of(context)!;

    return PageScaffold(
      title: 'Contact Us | VHDRSS',
      description:
          'Get in touch with VHDRSS — questions, partnerships, and support.',
      body: ContentContainer(
        padding:
            EdgeInsets.symmetric(vertical: 100, horizontal: isMobile ? 16 : 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.contactUs,
                style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 12),
            Text(l10n.contactUsSubtitle,
                style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 40),
            isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _submitted ? _buildThankYou(context) : _buildForm(),
                      const SizedBox(height: 40),
                      _buildInfoPanel(context),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 3,
                          child: _submitted
                              ? _buildThankYou(context)
                              : _buildForm()),
                      const SizedBox(width: 40),
                      Expanded(flex: 2, child: _buildInfoPanel(context)),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.divider),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: l10n.fullName,
              ),
              validator: (val) => (val == null || val.trim().isEmpty)
                  ? l10n.pleaseEnterName
                  : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: l10n.emailAddress,
              ),
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return l10n.pleaseEnterEmail;
                }
                if (!val.contains('@') || !val.contains('.')) {
                  return l10n.pleaseEnterValidEmail;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _subjectController,
              decoration: InputDecoration(labelText: l10n.subject),
              validator: (val) => (val == null || val.trim().isEmpty)
                  ? l10n.pleaseEnterSubject
                  : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _messageController,
              maxLines: 5,
              decoration: InputDecoration(
                  labelText: l10n.message, alignLabelWithHint: true),
              validator: (val) => (val == null || val.trim().isEmpty)
                  ? l10n.pleaseEnterMessage
                  : null,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: _submit, child: Text(l10n.sendMessage)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThankYou(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final name = _nameController.text.trim();
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        children: [
          const Icon(Icons.mark_email_read, color: AppColors.primary, size: 48)
              .animate()
              .scale(duration: 400.ms, curve: Curves.easeOutBack),
          const SizedBox(height: 20),
          Text(l10n.messageSent,
              style: Theme.of(context).textTheme.headlineLarge),
          const SizedBox(height: 12),
          Text(
            l10n.messageSentDescription(name),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms);
  }

  Widget _buildInfoPanel(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _InfoRow(icon: Icons.location_on, label: l10n.address),
          const SizedBox(height: 20),
          const _InfoRow(icon: Icons.email, label: 'contact@vhdrss.in'),
          const SizedBox(height: 20),
          const _InfoRow(icon: Icons.phone, label: '+91  855330 2195'),
          const SizedBox(height: 28),
          // Map placeholder — swap for a real embedded map (e.g. google_maps_flutter
          // or a static map image) once you have an address to pin.
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
            ),
            clipBehavior: Clip.antiAlias,
            child: const GoogleMapView(),
          )
        ],
      ),
    );
  }
}

class GoogleMapView extends StatefulWidget {
  const GoogleMapView({super.key});

  @override
  State<GoogleMapView> createState() => _GoogleMapViewState();
}

class _GoogleMapViewState extends State<GoogleMapView> {
  final String viewType = 'google-map-view';

  @override
  void initState() {
    super.initState();

    ui_web.platformViewRegistry.registerViewFactory(
      viewType,
      (int viewId) {
        final String placeQuery = Uri.encodeComponent(
          'Vishva hindu dharm Rakshak Seva Samiti head office, Bengaluru',
        );

        return web.HTMLIFrameElement()
          ..src = 'https://www.google.com/maps?q=$placeQuery&output=embed'
          ..style.border = '0'
          ..style.width = '100%'
          ..style.height = '100%';
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const HtmlElementView(
      viewType: 'google-map-view',
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  const _InfoRow({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.primary, size: 20),
        const SizedBox(width: 12),
        Expanded(
            child: Text(label, style: Theme.of(context).textTheme.bodyMedium)),
      ],
    );
  }
}
