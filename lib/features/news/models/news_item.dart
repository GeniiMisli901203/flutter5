class NewsItem {
  final String id;
  final String title;
  final String content;
  final String url;
  final DateTime date;

  NewsItem({
    required this.id,
    required this.title,
    required this.content,
    this.url = '',
    required this.date,
  });
}
