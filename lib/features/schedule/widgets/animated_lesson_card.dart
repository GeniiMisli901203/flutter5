import 'package:flutter/material.dart';
import '../models/lesson.dart';

class AnimatedLessonCard extends StatelessWidget {
  final Lesson lesson;
  final int index;

  const AnimatedLessonCard({
    required this.lesson,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500 + (index * 100)),
      curve: Curves.easeInOut,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              // Время с анимацией
              AnimatedContainer(
                duration: Duration(milliseconds: 400),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  lesson.time,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(width: 16),
              // Информация об уроке
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lesson.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '${lesson.teacher} · ${lesson.room}',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              // Анимированная иконка
              AnimatedRotation(
                duration: Duration(milliseconds: 500),
                turns: 0.25,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey[400],
                  size: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}