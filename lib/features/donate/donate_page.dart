import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/breakpoints.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/page_scaffold.dart';
import '../../shared/widgets/responsive_layout.dart';

class DonatePage extends StatefulWidget {
  const DonatePage({super.key});

  @override
  State<DonatePage> createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _customAmountController = TextEditingController();

  final List<int> _presetAmounts = [25, 50, 100, 250];
  int? _selectedPreset = 50;
  bool _isMonthly = false;
  bool _submitted = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _customAmountController.dispose();
    super.dispose();
  }

  int? get _finalAmount {
    if (_selectedPreset != null) return _selectedPreset;
    return int.tryParse(_customAmountController.text.trim());
  }

  String _impactLine(int amount) {
    if (amount >= 250)
      return 'That can fund a mobile clinic visit for an entire village.';
    if (amount >= 100)
      return 'That can supply school materials for 10 children for a term.';
    if (amount >= 50)
      return 'That can provide clean water access for a family for a month.';
    return 'That can provide a week of school meals for a child.';
  }

  void _submit() {
    if (_selectedPreset == null &&
        _customAmountController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please select or enter a donation amount.')),
      );
      return;
    }
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _submitted = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = Breakpoints.isMobile(width);

    return PageScaffold(
      title: 'Donate | Hopeworks Foundation',
      description:
          "Make a one-time or monthly donation to support Hopeworks Foundation's education, healthcare, and relief programs.",
      body: ContentContainer(
        padding:
            EdgeInsets.symmetric(vertical: 100, horizontal: isMobile ? 10 : 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Make a Donation',
                style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 12),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560),
              child: Text(
                '100% of your donation goes directly toward active programs. '
                'This form is currently a demo — no payment will be processed.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 40),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560),
              child: _submitted
                  ? _ThankYouCard(
                      amount: _finalAmount ?? 0, isMonthly: _isMonthly)
                  : _buildForm(isMobile),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm(bool isMobile) {
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
            // One-time / Monthly toggle
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.surfaceMuted,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                      child: _ToggleButton(
                          label: 'One-Time',
                          selected: !_isMonthly,
                          onTap: () => setState(() => _isMonthly = false))),
                  Expanded(
                      child: _ToggleButton(
                          label: 'Monthly',
                          selected: _isMonthly,
                          onTap: () => setState(() => _isMonthly = true))),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text('Choose an amount',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 14),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                for (final amount in _presetAmounts)
                  _AmountChip(
                    amount: amount,
                    selected: _selectedPreset == amount,
                    onTap: () => setState(() {
                      _selectedPreset = amount;
                      _customAmountController.clear();
                    }),
                  ),
              ],
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _customAmountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Custom amount (USD)',
                prefixText: '\$ ',
              ),
              onChanged: (val) => setState(() {
                if (val.trim().isNotEmpty) _selectedPreset = null;
              }),
            ),
            if (_finalAmount != null && _finalAmount! > 0) ...[
              const SizedBox(height: 10),
              Text(
                _impactLine(_finalAmount!),
                style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
            ],
            const SizedBox(height: 28),
            Text('Your details', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 14),
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
            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submit,
                child: Text(
                    'Donate ${_finalAmount != null ? '\$${_finalAmount!}' : ''}${_isMonthly ? '/mo' : ''}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ToggleButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _ToggleButton(
      {required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _AmountChip extends StatelessWidget {
  final int amount;
  final bool selected;
  final VoidCallback onTap;
  const _AmountChip(
      {required this.amount, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 90,
        padding: const EdgeInsets.symmetric(vertical: 14),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : AppColors.surfaceMuted,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: selected ? AppColors.primary : AppColors.divider),
        ),
        child: Text(
          '\$$amount',
          style: TextStyle(
            color: selected ? Colors.white : AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class _ThankYouCard extends StatelessWidget {
  final int amount;
  final bool isMonthly;
  const _ThankYouCard({required this.amount, required this.isMonthly});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        children: [
          const Icon(Icons.favorite, color: AppColors.primary, size: 48)
              .animate()
              .scale(duration: 400.ms, curve: Curves.easeOutBack),
          const SizedBox(height: 20),
          Text('Thank You!', style: Theme.of(context).textTheme.headlineLarge),
          const SizedBox(height: 12),
          Text(
            'Your ${isMonthly ? 'monthly' : 'one-time'} donation of \$$amount means the world '
            'to the communities we serve. A confirmation would normally be emailed to you here.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms);
  }
}
