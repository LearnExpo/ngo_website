import '../../core/localization/localized_text.dart';

class BlogPost {
  final String id;
  final LocalizedText title;
  final LocalizedText excerpt;
  final LocalizedText content;
  final String author;
  final String date;
  final LocalizedText category;
  final int readMinutes;

  const BlogPost({
    required this.id,
    required this.title,
    required this.excerpt,
    required this.content,
    required this.author,
    required this.date,
    required this.category,
    required this.readMinutes,
  });
}
