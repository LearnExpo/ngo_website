import 'package:flutter/material.dart';
import '../../core/constants/breakpoints.dart';

/// Picks one of [mobile] / [tablet] / [desktop] based on current width.
/// [tablet] and [desktop] fall back to the next-smallest provided variant
/// if omitted, so callers only need to define what actually differs.
class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (Breakpoints.isDesktop(width)) {
      return desktop ?? tablet ?? mobile;
    } else if (Breakpoints.isTablet(width)) {
      return tablet ?? mobile;
    }
    return mobile;
  }
}

/// Wraps page content with consistent horizontal padding and a max width,
/// so sections stay readable on ultra-wide screens.
class ContentContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const ContentContainer({
    super.key,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final horizontalPadding = Breakpoints.isMobile(width)
        ? 20.0
        : Breakpoints.isTablet(width)
            ? 40.0
            : 80.0;

    return Center(
      child: ConstrainedBox(
        constraints:
            const BoxConstraints(maxWidth: Breakpoints.maxContentWidth),
        child: Padding(
          padding: padding ??
              EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: child,
        ),
      ),
    );
  }
}
