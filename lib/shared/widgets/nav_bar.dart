import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ngo_website/core/localization/locale_controller.dart'
    show LocaleControllerScope;
import 'package:ngo_website/l10n/generated/app_localizations.dart';
import '../../core/constants/breakpoints.dart';
import '../../core/theme/app_colors.dart';
import 'responsive_layout.dart';

class NavItem {
  final String label;
  final String path;
  const NavItem(this.label, this.path);
}

/// Builds nav items with localized labels — call this instead of using a
/// static const list, since labels now depend on the current locale.
List<NavItem> buildNavItems(AppLocalizations l10n) => [
      NavItem(l10n.navHome, '/'),
      NavItem(l10n.navAbout, '/about'),
      NavItem(l10n.navPrograms, '/programs'),
      NavItem(l10n.navEvents, '/events'),
      NavItem(l10n.navGallery, '/gallery'),
      NavItem(l10n.navBlog, '/blog'),
      NavItem(l10n.navContact, '/contact'),
    ];

/// Top navigation bar. Shows full inline links on tablet/desktop and
/// collapses into a hamburger menu (end drawer) on mobile.
class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final currentPath = GoRouterState.of(context).uri.toString();
    final l10n = AppLocalizations.of(context)!;
    final navItems = buildNavItems(l10n);

    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      automaticallyImplyActions: false,
      actions: const [],
      title: ContentContainer(
        child: Row(
          children: [
            _Logo(onTap: () => context.go('/')),
            const Spacer(),
            if (!Breakpoints.isMobile(width)) ...[
              for (final item in navItems)
                _NavLink(
                  item: item,
                  isActive: currentPath == item.path,
                ),
              const SizedBox(width: 10),
              const _LanguageSwitcher(compact: true),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => context.go('/donate'),
                child: Text(l10n.navDonate),
              ),
            ] else ...[
              const _LanguageSwitcher(compact: true),
              Builder(
                builder: (ctx) => IconButton(
                  icon: const Icon(Icons.menu, color: AppColors.textPrimary),
                  onPressed: () => Scaffold.of(ctx).openEndDrawer(),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(76);
}

class _LanguageSwitcher extends StatelessWidget {
  final bool compact;
  const _LanguageSwitcher({this.compact = false});

  @override
  Widget build(BuildContext context) {
    final controller = LocaleControllerScope.of(context);
    final currentCode = controller.locale.languageCode;

    return PopupMenuButton<String>(
      tooltip: AppLocalizations.of(context)!.languageLabel,
      initialValue: currentCode,
      onSelected: (code) => controller.setLocale(Locale(code)),
      itemBuilder: (context) => const [
        PopupMenuItem(value: 'en', child: Text('English')),
        PopupMenuItem(value: 'hi', child: Text('हिन्दी')),
      ],
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.language, size: 18, color: AppColors.textPrimary),
          if (!compact) ...[
            const SizedBox(width: 4),
            Text(
              currentCode == 'hi' ? 'हिन्दी' : 'EN',
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ],
        ],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  final VoidCallback onTap;
  const _Logo({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    final width = MediaQuery.of(context).size.width;

    final isMobile = Breakpoints.isMobile(width);

    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: const BoxDecoration(
              // gradient: AppColors.heroGradient,
              shape: BoxShape.circle,
              color: Color.fromARGB(
                  255, 172, 204, 226), // fallback color if gradient fails
            ),
            child: const Image(
              image: AssetImage(
                'assets/images/logo.png',
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            isMobile && isEnglish ? 'VHDRSS' : l10n.name,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
        ],
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final NavItem item;
  final bool isActive;
  const _NavLink({required this.item, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: () => context.go(item.path),
        child: Text(
          item.label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
            color: isActive ? AppColors.primary : AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}

/// End drawer used for mobile navigation (opened via the hamburger icon).
class MobileNavDrawer extends StatelessWidget {
  const MobileNavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouterState.of(context).uri.toString();
    final l10n = AppLocalizations.of(context)!;
    final navItems = buildNavItems(l10n);

    return Drawer(
      backgroundColor: AppColors.background,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 24),
          children: [
            for (final item in navItems)
              ListTile(
                title: Text(
                  item.label,
                  style: TextStyle(
                    fontWeight: currentPath == item.path
                        ? FontWeight.w700
                        : FontWeight.w500,
                    color: currentPath == item.path
                        ? AppColors.primary
                        : AppColors.textPrimary,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  context.go(item.path);
                },
              ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  context.go('/donate');
                },
                child: const Text('Donate'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
