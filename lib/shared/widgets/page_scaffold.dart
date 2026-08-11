import 'package:flutter/material.dart';
import '../../core/seo/seo.dart';
import 'footer.dart';
import 'nav_bar.dart';

/// Every page in the site should use this so the nav bar, mobile drawer,
/// footer, and per-route SEO meta tags stay consistent automatically.
class PageScaffold extends StatefulWidget {
  final Widget body;
  final String title;
  final String description;

  const PageScaffold({
    super.key,
    required this.body,
    this.title =
        'VHDRSS — Nonprofit for Education, Healthcare & Disaster Relief',
    this.description =
        'VHDRSS is a nonprofit delivering education, healthcare, and disaster relief to communities in need.',
  });

  @override
  State<PageScaffold> createState() => _PageScaffoldState();
}

class _PageScaffoldState extends State<PageScaffold> {
  @override
  void initState() {
    super.initState();
    updateMetaTags(title: widget.title, description: widget.description);
  }

  @override
  void didUpdateWidget(covariant PageScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.title != widget.title ||
        oldWidget.description != widget.description) {
      updateMetaTags(title: widget.title, description: widget.description);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(),
      endDrawer: const MobileNavDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            widget.body,
            const AppFooter(),
          ],
        ),
      ),
    );
  }
}
