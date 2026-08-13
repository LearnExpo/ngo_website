import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:ngo_website/core/localization/localized_text.dart';
import 'package:ngo_website/data/models/blog_post.dart';
import '../../core/constants/breakpoints.dart';
import '../../core/theme/app_colors.dart';
import '../../data/blog_data.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../shared/widgets/page_scaffold.dart';
import '../../shared/widgets/responsive_layout.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = Breakpoints.isMobile(width);
    final isTablet = Breakpoints.isTablet(width);
    final columns = isMobile ? 1 : (isTablet ? 2 : 2);
    final l10n = AppLocalizations.of(context)!;

    return PageScaffold(
      title: 'Blog & News | VHDRSS',
      description: "Updates, milestones, and stories from VHDRSS's programs.",
      body: ContentContainer(
        padding:
            EdgeInsets.symmetric(vertical: 100, horizontal: isMobile ? 16 : 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(l10n.blogHeading,
                style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 12),
            Text(l10n.blogSubheading,
                style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 48),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: allBlogPosts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                childAspectRatio: isMobile ? 1.3 : 1.5,
              ),
              itemBuilder: (context, index) {
                final post = allBlogPosts[index];
                return _BlogCard(
                  post: post,
                )
                    .animate()
                    .fadeIn(delay: (index * 100).ms, duration: 400.ms)
                    .slideY(begin: 0.1, end: 0);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _BlogCard extends StatelessWidget {
  final BlogPost post;
  // final AppLocalizations l10n;
  const _BlogCard({
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final l10n = AppLocalizations.of(context)!;

    return InkWell(
      onTap: () => context.go('/blog/${post.id}'),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.divider),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.accent.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    post.category.resolve(locale),
                    style: const TextStyle(
                        fontSize: 11, fontWeight: FontWeight.w600),
                  ),
                ),
                const Spacer(),
                Text(post.date,
                    style: const TextStyle(
                        fontSize: 12, color: AppColors.textSecondary)),
              ],
            ),
            const SizedBox(height: 16),
            Text(post.title.resolve(locale),
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),
            Expanded(
              child: Text(
                post.excerpt.resolve(locale),
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.fade,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.byAuthorReadTime(post.author, post.readMinutes),
                  style: const TextStyle(
                      fontSize: 12, color: AppColors.textSecondary),
                ),
                Text('${l10n.readCta} →',
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
