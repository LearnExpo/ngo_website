class BlogPost {
  final String id;
  final String title;
  final String excerpt;
  final String content;
  final String author;
  final String date;
  final String category;
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