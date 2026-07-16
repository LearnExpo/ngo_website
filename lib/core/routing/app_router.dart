import 'package:go_router/go_router.dart';
import 'package:ngo_website/features/blog/blog_detail_page.dart';

import '../../features/about/about_page.dart';
import '../../features/blog/blog_page.dart';
import '../../features/contact/contact_page.dart';
import '../../features/donate/donate_page.dart';
import '../../features/events/events_page.dart';
import '../../features/gallery/gallery_page.dart';
import '../../features/home/home_page.dart';
import '../../features/programs/programs_page.dart';
import '../../features/volunteer/volunteer_page.dart';
import '../../features/programs/program_detail_page.dart';

/// Single source of truth for site navigation. Using go_router gives us
/// clean, shareable URLs (e.g. /programs, /donate) which also matters for
/// SEO — each route can carry its own page title/meta tags.
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
    GoRoute(path: '/about', builder: (context, state) => const AboutPage()),
    GoRoute(
        path: '/programs', builder: (context, state) => const ProgramsPage()),
    GoRoute(path: '/events', builder: (context, state) => const EventsPage()),
    GoRoute(path: '/gallery', builder: (context, state) => const GalleryPage()),
    GoRoute(path: '/blog', builder: (context, state) => const BlogPage()),
    GoRoute(path: '/donate', builder: (context, state) => const DonatePage()),
    GoRoute(
        path: '/volunteer', builder: (context, state) => const VolunteerPage()),
    GoRoute(path: '/contact', builder: (context, state) => const ContactPage()),
    GoRoute(
      path: '/programs',
      builder: (context, state) => const ProgramsPage(),
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) =>
              ProgramDetailPage(programId: state.pathParameters['id']!),
        ),
      ],
    ),
    GoRoute(
      path: '/blog',
      builder: (context, state) => const BlogPage(),
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) =>
              BlogDetailPage(postId: state.pathParameters['id']!),
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => const HomePage(),
);
