import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ngo_website/core/constants/breakpoints.dart';
import '../../core/theme/app_colors.dart';
import '../../data/blog_data.dart';
import '../../shared/widgets/page_scaffold.dart';
import '../../shared/widgets/responsive_layout.dart';

class BlogDetailPage extends StatelessWidget {
  final String postId;
  const BlogDetailPage({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = Breakpoints.isMobile(width);
    final isTablet = Breakpoints.isTablet(width);
    final columns = isMobile ? 1 : (isTablet ? 2 : 3);
    final post = findBlogPostById(postId);

    if (post == null) {
      return PageScaffold(
        title: '${post!.title} | Hopeworks Foundation',
        description: post.excerpt,
        body: ContentContainer(
          padding: const EdgeInsets.symmetric(vertical: 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Post not found',
                  style: Theme.of(context).textTheme.displayMedium),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () => context.go('/blog'),
                child: const Text('Back to Blog'),
              ),
            ],
          ),
        ),
      );
    }

    return PageScaffold(
      title: '${post.title} | Hopeworks Foundation',
      description: post.excerpt,
      body: ContentContainer(
        padding:
            EdgeInsets.symmetric(vertical: 100, horizontal: isMobile ? 10 : 0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton.icon(
                onPressed: () => context.go('/blog'),
                icon: const Icon(Icons.arrow_back, size: 16),
                label: const Text('All Posts'),
              ),
              const SizedBox(height: 20),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.accent.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  post.category,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 16),
              Text(post.title,
                  style: Theme.of(context).textTheme.displayMedium),
              const SizedBox(height: 12),
              Text(
                'By ${post.author} · ${post.date} · ${post.readMinutes} min read',
                style: const TextStyle(
                    color: AppColors.textSecondary, fontSize: 14),
              ),
              const SizedBox(height: 32),
              const Divider(),
              const SizedBox(height: 32),
              Text(
                post.content,
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
                      child: Text(
                        'Want to support programs like this?',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => context.go('/donate'),
                      child: const Text('Donate'),
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
