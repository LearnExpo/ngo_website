import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ngo_website/shared/widgets/wrapper.dart';
import '../../core/constants/breakpoints.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/page_scaffold.dart';
import '../../shared/widgets/responsive_layout.dart';

class VolunteerPage extends StatefulWidget {
  const VolunteerPage({super.key});

  @override
  State<VolunteerPage> createState() => _VolunteerPageState();
}

class _VolunteerPageState extends State<VolunteerPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();

  final List<String> _interestOptions = [
    'Education',
    'Healthcare',
    'Disaster Relief',
    'Clean Water',
    'Fundraising',
    'Remote/Admin Support',
  ];
  final Set<String> _selectedInterests = {};
  String _availability = 'Weekends';
  bool _submitted = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_selectedInterests.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please select at least one area of interest.')),
      );
      return;
    }
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _submitted = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Volunteer | VHDRSS',
      description:
          'Sign up to volunteer with VHDRSS across education, healthcare, disaster relief, and more.',
      body: ComingSoonWrapper(
        enabled: true,
        child: ContentContainer(
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Get Involved',
                  style: Theme.of(context).textTheme.displayMedium),
              const SizedBox(height: 12),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 560),
                child: Text(
                  'Tell us a bit about yourself and how you\'d like to help. '
                  'This is a demo form — no submission is sent yet.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const SizedBox(height: 40),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 560),
                child: _submitted ? _buildThankYou(context) : _buildForm(),
              ),
            ],
          ),
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
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration:
                  const InputDecoration(labelText: 'Phone number (optional)'),
            ),
            const SizedBox(height: 24),
            Text('Areas of interest',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (final interest in _interestOptions)
                  FilterChip(
                    label: Text(interest),
                    selected: _selectedInterests.contains(interest),
                    selectedColor: AppColors.primary.withValues(alpha: 0.15),
                    checkmarkColor: AppColors.primary,
                    onSelected: (val) => setState(() {
                      val
                          ? _selectedInterests.add(interest)
                          : _selectedInterests.remove(interest);
                    }),
                  ),
              ],
            ),
            const SizedBox(height: 24),
            Text('Availability', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              children: [
                for (final option in ['Weekdays', 'Weekends', 'Flexible'])
                  ChoiceChip(
                    label: Text(option),
                    selected: _availability == option,
                    selectedColor: AppColors.primary.withValues(alpha: 0.15),
                    onSelected: (_) => setState(() => _availability = option),
                  ),
              ],
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: _messageController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Anything else you\'d like us to know? (optional)',
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submit,
                child: const Text('Submit Application'),
              ),
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
          const Icon(Icons.volunteer_activism,
                  color: AppColors.primary, size: 48)
              .animate()
              .scale(duration: 400.ms, curve: Curves.easeOutBack),
          const SizedBox(height: 20),
          Text('Thanks for Signing Up!',
              style: Theme.of(context).textTheme.headlineLarge),
          const SizedBox(height: 12),
          Text(
            'We\'ve received your interest in ${_selectedInterests.join(', ')}. '
            'Our volunteer coordinator would normally reach out within a few days.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms);
  }
}
