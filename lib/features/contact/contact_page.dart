import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/breakpoints.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/page_scaffold.dart';
import '../../shared/widgets/responsive_layout.dart';

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

    return PageScaffold(
      title: 'Contact Us | Hopeworks Foundation',
  description: 'Get in touch with Hopeworks Foundation — questions, partnerships, and support.',
      body: ContentContainer(
        padding: const EdgeInsets.symmetric(vertical: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Contact Us',
                style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 12),
            Text('We\'d love to hear from you.',
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
          Expanded(flex: 3, child: _submitted ? _buildThankYou(context) : _buildForm()),
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
              decoration: const InputDecoration(labelText: 'Full name'),
              validator: (val) => (val == null || val.trim().isEmpty)
                  ? 'Please enter your name'
                  : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'Email address'),
              validator: (val) {
                if (val == null || val.trim().isEmpty)
                  return 'Please enter your email';
                if (!val.contains('@') || !val.contains('.'))
                  return 'Please enter a valid email';
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _subjectController,
              decoration: const InputDecoration(labelText: 'Subject'),
              validator: (val) => (val == null || val.trim().isEmpty)
                  ? 'Please enter a subject'
                  : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _messageController,
              maxLines: 5,
              decoration: const InputDecoration(
                  labelText: 'Message', alignLabelWithHint: true),
              validator: (val) => (val == null || val.trim().isEmpty)
                  ? 'Please enter a message'
                  : null,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: _submit, child: const Text('Send Message')),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThankYou(BuildContext context) {
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
          Text('Message Sent',
              style: Theme.of(context).textTheme.headlineLarge),
          const SizedBox(height: 12),
          Text(
            'Thanks for reaching out, ${_nameController.text.trim().isEmpty ? '' : _nameController.text.trim()}. '
            'Our team would normally reply within 1-2 business days.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms);
  }

  Widget _buildInfoPanel(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _InfoRow(
              icon: Icons.location_on,
              label: '123 Hope Street, San Francisco, CA'),
          const SizedBox(height: 20),
          _InfoRow(icon: Icons.email, label: 'contact@hopeworks.org'),
          const SizedBox(height: 20),
          _InfoRow(icon: Icons.phone, label: '+1 (555) 012-3456'),
          const SizedBox(height: 28),
          // Map placeholder — swap for a real embedded map (e.g. google_maps_flutter
          // or a static map image) once you have an address to pin.
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.divider,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Center(
              child: Icon(Icons.map, color: AppColors.textSecondary, size: 40),
            ),
          ),
        ],
      ),
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
