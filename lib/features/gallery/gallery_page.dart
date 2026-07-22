import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/breakpoints.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/page_scaffold.dart';
import '../../shared/widgets/responsive_layout.dart';

class GalleryItem {
  final String caption;
  final IconData icon;
  final Color color;
  const GalleryItem(this.caption, this.icon, this.color);
}

const List<GalleryItem> kGalleryItems = [
  GalleryItem('Classroom opening, Kenya', Icons.school, AppColors.primary),
  GalleryItem('Mobile clinic visit, Nepal', Icons.health_and_safety,
      AppColors.secondary),
  GalleryItem('Well drilling, Mali', Icons.water_drop, AppColors.accent),
  GalleryItem('Emergency relief, Philippines', Icons.emergency_share,
      AppColors.primaryDark),
  GalleryItem(
      'Vocational training, India', Icons.diversity_1, AppColors.success),
  GalleryItem(
      'School meal program, Uganda', Icons.restaurant, AppColors.secondaryDark),
  GalleryItem('Volunteer team, Peru', Icons.groups, AppColors.primaryLight),
  GalleryItem('Community meeting, Bangladesh', Icons.forum, AppColors.primary),
];

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = Breakpoints.isMobile(width);
    final isTablet = Breakpoints.isTablet(width);
    final columns = isMobile ? 2 : (isTablet ? 3 : 4);

    return PageScaffold(
      title: 'About Us | Hopeworks Foundation',
      description:
          "Learn about Hopeworks Foundation's mission, history, and the team delivering education, healthcare, and relief programs worldwide.",
      body: ContentContainer(
        padding:
            EdgeInsets.symmetric(vertical: 100, horizontal: isMobile ? 10 : 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Gallery', style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 12),
            Text(
              'Moments from our programs around the world.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Container(
        // TODO Phase 3.5: replace this placeholder color block with
        // Image.network('https://...') or Image.asset('assets/images/...')
        // once real photos are available. Keep the caption overlay below.
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
                  item.caption,
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
