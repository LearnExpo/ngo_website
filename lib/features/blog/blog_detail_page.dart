import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ngo_website/core/localization/localized_text.dart';
import '../../core/theme/app_colors.dart';
import '../../data/blog_data.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../shared/widgets/page_scaffold.dart';
import '../../shared/widgets/responsive_layout.dart';

class BlogDetailPage extends StatelessWidget {
  final String postId;
  const BlogDetailPage({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    final post = findBlogPostById(postId);
    final l10n = AppLocalizations.of(context)!;

    if (post == null) {
      return PageScaffold(
        title: 'Blog | VHDRSS',
        body: ContentContainer(
          padding: const EdgeInsets.symmetric(vertical: 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.postNotFound,
                  style: Theme.of(context).textTheme.displayMedium),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () => context.go('/blog'),
                child: Text(l10n.allPosts),
              ),
            ],
          ),
        ),
      );
    }

    final locale = Localizations.localeOf(context);

    return PageScaffold(
      title: '${post.title.resolve(locale)} | VHDRSS',
      description: post.excerpt.resolve(locale),
      body: ContentContainer(
        padding: const EdgeInsets.symmetric(vertical: 100),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton.icon(
                onPressed: () => context.go('/blog'),
                icon: const Icon(Icons.arrow_back, size: 16),
                label: Text(l10n.allPosts),
              ),
              const SizedBox(height: 20),
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
                      fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 16),
              Text(post.title.resolve(locale),
                  style: Theme.of(context).textTheme.displayMedium),
              const SizedBox(height: 12),
              Text(
                '${l10n.byAuthorReadTime(post.author, post.readMinutes)} · ${post.date}',
                style: const TextStyle(
                    color: AppColors.textSecondary, fontSize: 14),
              ),
              const SizedBox(height: 32),
              const Divider(),
              const SizedBox(height: 32),
              Text(
                post.content.resolve(locale),
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(height: 1.8),
              ),
              const SizedBox(height: 48),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.surfaceMuted,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(l10n.blogDonateCta,
                          style: Theme.of(context).textTheme.titleLarge),
                    ),
                    ElevatedButton(
                      onPressed: () => context.go('/donate'),
                      child: Text(l10n.heroDonateBtn),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
