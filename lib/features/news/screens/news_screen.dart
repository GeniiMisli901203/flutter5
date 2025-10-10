import 'package:flutter/material.dart';
import '../../../state/app_state.dart';
import '../models/news_item.dart';
import '../widgets/add_news_dialog.dart';

class NewsScreen extends StatelessWidget {
  final List<NewsItem> news;
  final AppState appState;

  const NewsScreen({required this.news, required this.appState});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Новости школы'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AddNewsDialog(
                  onAddNews: (title, content, url) {
                    final newNews = NewsItem(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      title: title,
                      content: content,
                      url: url,
                      date: DateTime.now(),
                    );
                    appState.addNewsToBeginning(newNews); // Добавляем в начало списка
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: news.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.article, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            const Text(
              'Нет новостей',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              'Потяните вниз для обновления',
              style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
            ),
          ],
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: news.length,
        itemBuilder: (context, index) {
          final newsItem = news[index];
          return Dismissible(
            key: Key(newsItem.id),
            direction: DismissDirection.endToStart,
            background: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(
                Icons.delete,
                color: Colors.white,
                size: 30,
              ),
            ),
            confirmDismiss: (direction) async {
              return await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Удалить новость?'),
                    content: const Text('Вы уверены, что хотите удалить эту новость?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('Отмена'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text('Удалить', style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  );
                },
              );
            },
            onDismissed: (direction) {
              final removedNews = newsItem;
              appState.removeNews(newsItem.id);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Новость удалена'),
                  duration: const Duration(seconds: 4),
                  action: SnackBarAction(
                    label: 'ОТМЕНА',
                    textColor: Colors.white,
                    onPressed: () {
                      appState.addNews(removedNews);
                    },
                  ),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.only(bottom: 12),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'НОВОСТЬ',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '${newsItem.date.day.toString().padLeft(2, '0')}.${newsItem.date.month.toString().padLeft(2, '0')}.${newsItem.date.year}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      newsItem.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      newsItem.content,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                        height: 1.4,
                      ),
                    ),
                    if (newsItem.url.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {
                          // Открытие ссылки в браузере
                        },
                        child: Text(
                          'Ссылка: ${newsItem.url}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
