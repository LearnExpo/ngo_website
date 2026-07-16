import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/breakpoints.dart';
import '../../core/theme/app_colors.dart';
import 'responsive_layout.dart';

class NavItem {
  final String label;
  final String path;
  const NavItem(this.label, this.path);
}

const List<NavItem> kNavItems = [
  NavItem('Home', '/'),
  NavItem('About', '/about'),
  NavItem('Programs', '/programs'),
  NavItem('Events', '/events'),
  NavItem('Gallery', '/gallery'),
  NavItem('Blog', '/blog'),
  NavItem('Contact', '/contact'),
];

/// Top navigation bar. Shows full inline links on tablet/desktop and
/// collapses into a hamburger menu (end drawer) on mobile.
class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final currentPath = GoRouterState.of(context).uri.toString();

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
              for (final item in kNavItems)
                _NavLink(
                  item: item,
                  isActive: currentPath == item.path,
                ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () => context.go('/donate'),
                child: const Text('Donate'),
              ),
            ] else
              Builder(
                builder: (ctx) => IconButton(
                  icon: const Icon(Icons.menu, color: AppColors.textPrimary),
                  onPressed: () => Scaffold.of(ctx).openEndDrawer(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(76);
}

class _Logo extends StatelessWidget {
  final VoidCallback onTap;
  const _Logo({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              gradient: AppColors.heroGradient,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.favorite, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 10),
          Text(
            'Hopeworks',
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
      padding: const EdgeInsets.symmetric(horizontal: 12),
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

    return Drawer(
      backgroundColor: AppColors.background,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 24),
          children: [
            for (final item in kNavItems)
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
