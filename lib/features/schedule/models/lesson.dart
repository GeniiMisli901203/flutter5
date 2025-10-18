// models/lesson.dart
class Lesson {
  final String id;
  final String title;
  final String time;
  final String teacher;
  final String room;
  final String description;
  final String homework;
  final String materials;
  final int dayOfWeek; // 0-4 для Пн-Пт

  Lesson({
    required this.id,
    required this.title,
    required this.time,
    required this.teacher,
    required this.room,
    required this.description,
    required this.homework,
    required this.materials,
    required this.dayOfWeek,
  });

  // Копирующий конструктор для редактирования
  Lesson copyWith({
    String? id,
    String? title,
    String? time,
    String? teacher,
    String? room,
    String? description,
    String? homework,
    String? materials,
    int? dayOfWeek,
  }) {
    return Lesson(
      id: id ?? this.id,
      title: title ?? this.title,
      time: time ?? this.time,
      teacher: teacher ?? this.teacher,
      room: room ?? this.room,
      description: description ?? this.description,
      homework: homework ?? this.homework,
      materials: materials ?? this.materials,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
    );
  }
}