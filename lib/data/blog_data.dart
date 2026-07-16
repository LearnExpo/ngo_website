import 'models/blog_post.dart';

const List<BlogPost> allBlogPosts = [
  BlogPost(
    id: 'new-school-kenya',
    title: 'Our 15th School Opens in Rural Kenya',
    excerpt:
        'This month we celebrated the opening of our newest classroom block, bringing education access to over 400 more children.',
    content:
        'After eight months of construction and partnership with the local community council, our 15th school opened its doors '
        'this month in Turkana County, Kenya. The classroom block includes four rooms, a small library, and a rainwater '
        'harvesting system to support the attached kitchen garden.\n\n'
        'Over 400 children who previously walked more than two hours to the nearest school will now attend classes just '
        'minutes from home. Local teachers have already completed training, and the school year begins next month.\n\n'
        'This project was funded entirely by our Education Access program donors — thank you to everyone who contributed.',
    author: 'Michael Osei',
    date: 'Jun 28, 2026',
    category: 'Education',
    readMinutes: 4,
  ),
  BlogPost(
    id: 'mobile-clinic-milestone',
    title: 'Mobile Clinics Reach 50,000th Patient',
    excerpt:
        'A major milestone for our Healthcare Outreach program: fifty thousand patients served since the program began in 2017.',
    content:
        'Our fleet of mobile medical units has now provided checkups, vaccinations, and essential care to 50,000 patients '
        'across remote communities in six countries. What started as a single van in 2017 has grown into a rotating team '
        'of 22 volunteer doctors and nurses supported by local health workers.\n\n'
        'The 50,000th patient was a newborn in a village outside Kathmandu, receiving a routine check alongside her mother '
        'just two days after birth — exactly the kind of accessible, everyday care this program exists to provide.',
    author: 'Sarah Connolly',
    date: 'Jun 10, 2026',
    category: 'Healthcare',
    readMinutes: 3,
  ),
  BlogPost(
    id: 'disaster-response-philippines',
    title: 'Rapid Response: Typhoon Relief in the Philippines',
    excerpt:
        'Within 36 hours of the typhoon making landfall, our emergency team was on the ground distributing food, water, and shelter kits.',
    content:
        'When Typhoon Amara made landfall on the eastern coast, our pre-positioned relief cache in Cebu meant our team could '
        'mobilize within 36 hours — well ahead of our 48-hour response target.\n\n'
        'Over the following two weeks, the team distributed food and water to 2,300 households and set up 40 emergency '
        'shelter kits for families whose homes were destroyed. We\'re now working with local partners on a longer-term '
        'rebuilding phase, expected to run through the end of the year.',
    author: 'Lina Farouk',
    date: 'May 22, 2026',
    category: 'Emergency',
    readMinutes: 5,
  ),
  BlogPost(
    id: 'annual-report-2025',
    title: '2025 Annual Report: A Year in Numbers',
    excerpt:
        'A transparent look at how every donated dollar was used across our programs last year.',
    content:
        'Our 2025 Annual Report is now available, detailing program spending, administrative costs, and outcomes across '
        'all six of our core programs. Highlights include a 22% increase in program reach year-over-year and the launch '
        'of two new initiatives: Women\'s Empowerment and Child Nutrition.\n\n'
        'As always, 84 cents of every dollar donated went directly to program delivery, with the remainder covering '
        'essential operations and fundraising costs. Full financials are available in the downloadable report.',
    author: 'James Whitfield',
    date: 'Mar 15, 2026',
    category: 'Transparency',
    readMinutes: 6,
  ),
];

BlogPost? findBlogPostById(String id) {
  for (final post in allBlogPosts) {
    if (post.id == id) return post;
  }
  return null;
}