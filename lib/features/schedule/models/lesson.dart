class Lesson {
  final String id;
  final String title;
  final String time;
  final String teacher;
  final String room;
  final String description;
  final String homework;
  final String materials;

  Lesson({
    required this.id,
    required this.title,
    required this.time,
    required this.teacher,
    required this.room,
    this.description = '',
    this.homework = '',
    this.materials = '',
  });
}