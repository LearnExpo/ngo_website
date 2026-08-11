import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/breakpoints.dart';
import '../../core/localization/localized_text.dart';
import '../../core/theme/app_colors.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../shared/widgets/page_scaffold.dart';
import '../../shared/widgets/responsive_layout.dart';

class GalleryItem {
  final LocalizedText caption;
  final IconData icon;
  final Color color;
  const GalleryItem(this.caption, this.icon, this.color);
}

const List<GalleryItem> kGalleryItems = [
  GalleryItem(
    {
      'en': 'Flag Hoisting Ceremony',
      'hi': 'ध्वजारोहण समारोह',
    },
    Icons.flag,
    AppColors.primary,
  ),
  GalleryItem(
    {
      'en': 'Religious and Cultural Programs',
      'hi': 'धार्मिक एवं सांस्कृतिक कार्यक्रम',
    },
    Icons.local_library,
    AppColors.secondary,
  ),
  GalleryItem(
    {
      'en': 'Hindu Dharma Awareness Program',
      'hi': 'हिंदू धर्म जागरूकता कार्यक्रम',
    },
    Icons.local_library,
    AppColors.accent,
  ),
  GalleryItem(
    {
      'en': 'Social Service Activities',
      'hi': 'सामाजिक सेवा गतिविधियाँ',
    },
    Icons.local_library,
    AppColors.primaryDark,
  ),
  GalleryItem(
    {
      'en': 'Community Service',
      'hi': 'समाज सेवा',
    },
    Icons.local_library,
    AppColors.success,
  ),
  GalleryItem(
    {
      'en': 'Cultural Heritage and Traditions',
      'hi': 'सांस्कृतिक विरासत एवं परंपराएँ',
    },
    Icons.local_library,
    AppColors.secondaryDark,
  ),
  GalleryItem(
    {
      'en': 'National and Religious Events',
      'hi': 'राष्ट्रीय एवं धार्मिक आयोजन',
    },
    Icons.local_library,
    AppColors.primaryLight,
  ),
  GalleryItem(
    {
      'en': 'Community Gathering',
      'hi': 'सामुदायिक सभा',
    },
    Icons.local_library,
    AppColors.primary,
  ),
];

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = Breakpoints.isMobile(width);
    final isTablet = Breakpoints.isTablet(width);
    final columns = isMobile ? 2 : (isTablet ? 3 : 4);
    final l10n = AppLocalizations.of(context)!;

    return PageScaffold(
      title: 'Gallery | VHDRSS',
      description: "Photos from VHDRSS's programs around the world.",
      body: ContentContainer(
        padding: const EdgeInsets.symmetric(vertical: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(l10n.galleryHeading,
                style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 12),
            Text(l10n.gallerySubheading,
                style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 48),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: kGalleryItems.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final item = kGalleryItems[index];
                return _GalleryTile(item: item)
                    .animate()
                    .fadeIn(delay: (index * 60).ms, duration: 350.ms)
                    .scale(
                        begin: const Offset(0.95, 0.95),
                        end: const Offset(1, 1));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _GalleryTile extends StatelessWidget {
  final GalleryItem item;
  const _GalleryTile({required this.item});

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Container(
        // TODO Phase 3.5: replace this placeholder color block with a real
        // Image.network(...) / Image.asset(...) once photos are available.
        color: item.color.withOpacity(0.85),
        child: Stack(
          children: [
            Center(child: Icon(item.icon, color: Colors.white, size: 40)),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                color: Colors.black.withOpacity(0.35),
                child: Text(
                  item.caption.resolve(locale),
                  style: const TextStyle(color: Colors.white, fontSize: 11),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
