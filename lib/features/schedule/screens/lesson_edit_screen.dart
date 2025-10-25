// screens/lesson_edit_screen.dart
import 'package:flutter/material.dart';
import '../models/lesson.dart';

class LessonEditScreen extends StatefulWidget {
  final Lesson? lesson;
  final Function(Lesson) onSave;
  final Function(String)? onDelete;
  final VoidCallback? onSuccess;

  const LessonEditScreen({
    Key? key,
    this.lesson,
    required this.onSave,
    this.onDelete,
    this.onSuccess,
  }) : super(key: key);

  @override
  _LessonEditScreenState createState() => _LessonEditScreenState();
}

class _LessonEditScreenState extends State<LessonEditScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _timeController = TextEditingController();
  final _teacherController = TextEditingController();
  final _roomController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _homeworkController = TextEditingController();
  final _materialsController = TextEditingController();

  int _selectedDay = 0;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _isEditing = widget.lesson != null;

    if (_isEditing) {
      final lesson = widget.lesson!;
      _titleController.text = lesson.title;
      _timeController.text = lesson.time;
      _teacherController.text = lesson.teacher;
      _roomController.text = lesson.room;
      _descriptionController.text = lesson.description;
      _homeworkController.text = lesson.homework;
      _materialsController.text = lesson.materials;
      _selectedDay = lesson.dayOfWeek;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _timeController.dispose();
    _teacherController.dispose();
    _roomController.dispose();
    _descriptionController.dispose();
    _homeworkController.dispose();
    _materialsController.dispose();
    super.dispose();
  }

  void _saveLesson() {
    if (_formKey.currentState!.validate()) {
      final lesson = Lesson(
        id: _isEditing ? widget.lesson!.id : DateTime.now().millisecondsSinceEpoch.toString(),
        title: _titleController.text,
        time: _timeController.text,
        teacher: _teacherController.text,
        room: _roomController.text,
        description: _descriptionController.text,
        homework: _homeworkController.text,
        materials: _materialsController.text,
        dayOfWeek: _selectedDay,
      );

      widget.onSave(lesson);
      widget.onSuccess?.call();

      // Переходим на экран успеха
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => _SuccessScreen(
            message: _isEditing ? 'Урок обновлен!' : 'Урок добавлен!',
          ),
        ),
      );
    }
  }

  void _deleteLesson() {
    if (widget.lesson != null && widget.onDelete != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Удалить урок'),
          content: Text('Вы уверены, что хотите удалить урок "${_titleController.text}"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Отмена'),
            ),
            TextButton(
              onPressed: () {
                widget.onDelete!(widget.lesson!.id);
                Navigator.of(context).pop(); // закрываем диалог
                // Переходим на экран успеха удаления
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => _SuccessScreen(
                      message: 'Урок удален!',
                    ),
                  ),
                );
              },
              child: Text('Удалить', style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final days = ['Понедельник', 'Вторник', 'Среда', 'Четверг', 'Пятница'];

    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Редактировать урок' : 'Добавить урок'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false, // ← УБИРАЕМ кнопку назад
        actions: [
          if (_isEditing && widget.onDelete != null)
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: _deleteLesson,
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // День недели
              Text('День недели', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              SizedBox(height: 8),
              DropdownButtonFormField<int>(
                value: _selectedDay,
                items: days.asMap().entries.map((entry) {
                  return DropdownMenuItem(
                    value: entry.key,
                    child: Text(entry.value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedDay = value!;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
              SizedBox(height: 16),

              // Название урока
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Название урока*',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите название урока';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Время
              TextFormField(
                controller: _timeController,
                decoration: InputDecoration(
                  labelText: 'Время (например: 9:00-9:45)*',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите время урока';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Преподаватель
              TextFormField(
                controller: _teacherController,
                decoration: InputDecoration(
                  labelText: 'Преподаватель*',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите имя преподавателя';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Кабинет
              TextFormField(
                controller: _roomController,
                decoration: InputDecoration(
                  labelText: 'Кабинет*',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите номер кабинета';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Описание
              TextFormField(
                controller: _descriptionController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Описание урока',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
              ),
              SizedBox(height: 16),

              // Домашнее задание
              TextFormField(
                controller: _homeworkController,
                maxLines: 2,
                decoration: InputDecoration(
                  labelText: 'Домашнее задание',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
              ),
              SizedBox(height: 16),

              // Материалы
              TextFormField(
                controller: _materialsController,
                maxLines: 2,
                decoration: InputDecoration(
                  labelText: 'Необходимые материалы',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
              ),
              SizedBox(height: 24),

              // Кнопки
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _saveLesson,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: Text(_isEditing ? 'Сохранить изменения' : 'Добавить урок'),
                    ),
                  ),
                ],
              ),
              // ← УБИРАЕМ кнопку "Отмена" полностью
            ],
          ),
        ),
      ),
    );
  }
}

// Экран успешного выполнения операции
class _SuccessScreen extends StatelessWidget {
  final String message;

  const _SuccessScreen({
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Успех'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 80,
              ),
              SizedBox(height: 24),
              Text(
                message,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                'Операция выполнена успешно',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  // Просто закрываем экран успеха - вернемся к расписанию
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: Text('Продолжить'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}