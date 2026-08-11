import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ngo_website/shared/widgets/wrapper.dart';
import '../../core/constants/breakpoints.dart';
import '../../core/theme/app_colors.dart';
import '../../l10n/generated/app_localizations.dart';
import 'nav_bar.dart';
import 'responsive_layout.dart';

/// Global footer: quick links, newsletter signup (UI-only for now), and
/// social icons. Used at the bottom of every page.
class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.textPrimary,
      padding: const EdgeInsets.symmetric(vertical: 56),
      child: ContentContainer(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = Breakpoints.isMobile(constraints.maxWidth);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isMobile)
                  // Mobile: plain vertical stack, no Expanded — heights
                  // are unbounded here so Expanded would break layout.
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _AboutBlurb(isMobile: true),
                      const SizedBox(height: 32),
                      _QuickLinks(),
                      const SizedBox(height: 32),
                      _NewsletterSignup(),
                    ],
                  )
                else
                  // Desktop/tablet: Row has a bounded width, so Expanded
                  // is valid here for proportional column widths.
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                          flex: 2, child: _AboutBlurb(isMobile: false)),
                      const SizedBox(width: 40),
                      Expanded(child: _QuickLinks()),
                      const SizedBox(width: 40),
                      Expanded(child: _NewsletterSignup()),
                    ],
                  ),
                const SizedBox(height: 40),
                const Divider(color: Colors.white24),
                const SizedBox(height: 20),
                Text(
                  '© ${DateTime.now().year} ${AppLocalizations.of(context)!.navName}. ${AppLocalizations.of(context)!.footerCopyright}',
                  style: const TextStyle(color: Colors.white54, fontSize: 13),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _AboutBlurb extends StatelessWidget {
  final bool isMobile;
  const _AboutBlurb({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                gradient: AppColors.heroGradient,
                shape: BoxShape.circle,
              ),
              child:
                  Image.asset("assets/images/logo.png", width: 32, height: 32),
              // child: const Icon(Icons.favorite, color: Colors.white, size: 18),
            ),
            const SizedBox(width: 10),
            Text(
              l10n.navName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: isMobile ? double.infinity : 320,
          child: Text(
            l10n.tagLine,
            style: const TextStyle(
                color: Colors.white70, fontSize: 14, height: 1.6),
          ),
        ),
        const SizedBox(height: 20),
        const Row(
          children: [
            _SocialIcon(Icons.facebook),
            _SocialIcon(Icons.alternate_email),
            _SocialIcon(Icons.camera_alt_outlined),
            _SocialIcon(Icons.play_circle_outline),
          ],
        ),
      ],
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  const _SocialIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: CircleAvatar(
        radius: 16,
        backgroundColor: Colors.white12,
        child: Icon(icon, color: Colors.white, size: 16),
      ),
    );
  }
}

class _QuickLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final navItems = buildNavItems(l10n);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.footerQuickLinks,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        for (final item in navItems)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: InkWell(
              onTap: () => context.go(item.path),
              child: Text(
                item.label,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ),
          ),
      ],
    );
  }
}

class _NewsletterSignup extends StatefulWidget {
  @override
  State<_NewsletterSignup> createState() => _NewsletterSignupState();
}

class _NewsletterSignupState extends State<_NewsletterSignup> {
  final _controller = TextEditingController();
  bool _submitted = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.footerStayUpdated,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          AppLocalizations.of(context)!.footerNewsletterBody,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
        const SizedBox(height: 12),
        if (_submitted)
          Text(
            AppLocalizations.of(context)!.footerThanks,
            style: const TextStyle(color: AppColors.accent, fontSize: 14),
          )
        else
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.footerEmailHint,
                    hintStyle: const TextStyle(color: Colors.white38),
                    filled: true,
                    fillColor: Colors.white12,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: () {
                  if (_controller.text.trim().isEmpty) return;
                  setState(() => _submitted = true);
                },
                icon: const Icon(Icons.send, color: AppColors.accent),
              ),
            ],
          ),
      ],
    );
  }
}
