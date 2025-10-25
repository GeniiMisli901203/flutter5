import 'package:flutter/material.dart';
import '../models/lesson.dart';
import 'lesson_edit_screen.dart';

class LessonDetailScreen extends StatelessWidget {
  final Lesson lesson;
  final Function(Lesson)? onEdit;
  final Function(String)? onDelete;

  const LessonDetailScreen({
    Key? key,
    required this.lesson,
    this.onEdit,
    this.onDelete,
  }) : super(key: key);

  void _goBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Подробности урока'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => _goBack(context),
        ),
        actions: [
          if (onEdit != null)
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LessonEditScreen(
                      lesson: lesson,
                      onSave: onEdit!,
                      onDelete: onDelete,
                    ),
                  ),
                );
              },
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заголовок
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lesson.title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800],
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.access_time, size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Text(
                          lesson.time,
                          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                        ),
                        SizedBox(width: 16),
                        Icon(Icons.place, size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Text(
                          'Кабинет ${lesson.room}',
                          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.person, size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Text(
                          lesson.teacher,
                          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Описание урока
            _buildInfoSection(
              'Описание урока',
              Icons.description,
              lesson.description.isNotEmpty ? lesson.description : 'Описание отсутствует',
            ),
            SizedBox(height: 16),

            // Домашнее задание
            _buildInfoSection(
              'Домашнее задание',
              Icons.assignment,
              lesson.homework.isNotEmpty ? lesson.homework : 'Домашнее задание не задано',
              color: Colors.orange,
            ),
            SizedBox(height: 16),

            // Необходимые материалы
            _buildInfoSection(
              'Необходимые материалы',
              Icons.school,
              lesson.materials.isNotEmpty ? lesson.materials : 'Специальные материалы не требуются',
              color: Colors.green,
            ),

            // Дополнительная кнопка "Назад" внизу экрана
            SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () => _goBack(context), // ← ЯВНЫЙ POP
                icon: Icon(Icons.arrow_back),
                label: Text('Вернуться к расписанию'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection(String title, IconData icon, String content, {Color color = Colors.blue}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, size: 18, color: color),
                ),
                SizedBox(width: 12),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              content,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}