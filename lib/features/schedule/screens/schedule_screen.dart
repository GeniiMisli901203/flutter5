import 'package:flutter/material.dart';
import '../models/lesson.dart';
import 'lesson_detail_screen.dart';
import 'lesson_edit_screen.dart';

class ScheduleScreen extends StatelessWidget {
  final List<Lesson> lessons;
  final int selectedDay;
  final Function(int) onDaySelected;
  final Function(Lesson) onAddLesson;
  final Function(Lesson) onEditLesson;
  final Function(String) onDeleteLesson;

  const ScheduleScreen({
    Key? key,
    required this.lessons,
    required this.selectedDay,
    required this.onDaySelected,
    required this.onAddLesson,
    required this.onEditLesson,
    required this.onDeleteLesson,
  }) : super(key: key);

  void _showLessonDetails(BuildContext context, Lesson lesson) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LessonDetailScreen(
          lesson: lesson,
          onEdit: onEditLesson,
          onDelete: onDeleteLesson,
        ),
      ),
    );
  }

  void _addNewLesson(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LessonEditScreen(
          onSave: onAddLesson,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final days = ['Понедельник', 'Вторник', 'Среда', 'Четверг', 'Пятница'];
    final shortDays = ['ПН', 'ВТ', 'СР', 'ЧТ', 'ПТ'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Расписание'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Селектор дней
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: Colors.grey[50],
              border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              children: days.asMap().entries.map((entry) {
                final index = entry.key;
                final day = entry.value;
                return Container(
                  margin: EdgeInsets.only(right: 8),
                  child: ElevatedButton(
                    onPressed: () => onDaySelected(index),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedDay == index
                          ? Colors.blue
                          : Colors.white,
                      foregroundColor: selectedDay == index
                          ? Colors.white
                          : Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: selectedDay == index
                              ? Colors.blue
                              : Colors.blue.withOpacity(0.3),
                        ),
                      ),
                      elevation: selectedDay == index ? 2 : 0,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          shortDays[index],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          day,
                          style: TextStyle(
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          // Основной контент
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 5),
              child: lessons.isEmpty
                  ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.schedule, size: 60, color: Colors.grey),
                    SizedBox(height: 12),
                    Text(
                      'Нет уроков на выбранный день',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () => _addNewLesson(context),
                      child: Text('Добавить первый урок'),
                    ),
                  ],
                ),
              )
                  : ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                itemCount: lessons.length,
                itemBuilder: (context, index) {
                  final lesson = lessons[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () => _showLessonDetails(context, lesson),
                        borderRadius: BorderRadius.circular(10),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          leading: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                lesson.time.split('-').first,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          title: Text(
                            lesson.title,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 2),
                              Text(
                                lesson.teacher,
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(height: 1),
                              Text(
                                'Каб. ${lesson.room}',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNewLesson(context),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
    );
  }
}