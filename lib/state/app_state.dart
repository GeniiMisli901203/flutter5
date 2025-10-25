import 'package:flutter/material.dart';
import '../features/schedule/models/lesson.dart';
import '../features/news/models/news_item.dart';

enum AppScreen { news, schedule, profile }

class StudentProfile {
  final String name;
  final String className;
  final String email;
  final String phoneNumber;
  final String avatarUrl;

  StudentProfile({
    required this.name,
    required this.className,
    required this.email,
    required this.phoneNumber,
    required this.avatarUrl,
  });
}

class AppState extends ChangeNotifier {
  AppScreen _currentScreen = AppScreen.schedule;
  int _selectedDay = 0;

  // Список новостей
  List<NewsItem> _news = [
    NewsItem(
      id: '1',
      title: 'Важное объявление',
      content: 'Завтра собрание родителей в 18:00 в актовом зале.',
      url: '',
      date: DateTime.now(),
    ),
    NewsItem(
      id: '2',
      title: 'Конкурс проектов',
      content: 'Принимаются заявки на школьный конкурс научных проектов до 25 числа.',
      url: '',
      date: DateTime.now(),
    ),
    NewsItem(
      id: '3',
      title: 'Школьная олимпиада',
      content: 'Математическая олимпиада пройдет в следующем месяце. Запись у классных руководителей.',
      url: '',
      date: DateTime.now(),
    ),
    NewsItem(
      id: '4',
      title: 'Спортивные соревнования',
      content: 'В субботу состоятся межшкольные соревнования по баскетболу.',
      url: '',
      date: DateTime.now(),
    ),
  ];

  // Список уроков для каждого дня недели
  List<List<Lesson>> _lessonsByDay = [
    // Понедельник
    [
      Lesson(
        id: '1',
        title: 'Математика',
        time: '9:00-9:45',
        teacher: 'Иванова А.И.',
        room: '101',
        description: 'Алгебра и начала анализа. Тема: Производная функции.',
        homework: 'Учебник: стр. 45-48, № 125-130',
        materials: 'Учебник, тетрадь, калькулятор',
        dayOfWeek: 0,
      ),
      Lesson(
        id: '2',
        title: 'Литература',
        time: '10:00-10:45',
        teacher: 'Петрова С.В.',
        room: '102',
        description: 'Русская литература XIX века. Тема: Творчество А.С. Пушкина.',
        homework: 'Прочитать "Евгений Онегин" главы 1-2',
        materials: 'Учебник, тетрадь, хрестоматия',
        dayOfWeek: 0,
      ),
      Lesson(
        id: '3',
        title: 'Физика',
        time: '11:00-11:45',
        teacher: 'Сидоров П.К.',
        room: '103',
        description: 'Механика. Тема: Законы Ньютона.',
        homework: 'Решить задачи на стр. 78-80',
        materials: 'Учебник, тетрадь, лабораторное оборудование',
        dayOfWeek: 0,
      ),
    ],
    // Вторник
    [
      Lesson(
        id: '4',
        title: 'История',
        time: '9:00-9:45',
        teacher: 'Козлова М.Н.',
        room: '104',
        description: 'Всемирная история. Тема: Эпоха Возрождения.',
        homework: 'Подготовить доклад о Леонардо да Винчи',
        materials: 'Учебник, атлас, контурные карты',
        dayOfWeek: 1,
      ),
      Lesson(
        id: '5',
        title: 'Химия',
        time: '10:00-10:45',
        teacher: 'Васильева О.П.',
        room: '105',
        description: 'Общая химия. Тема: Периодическая система химических элементов.',
        homework: 'Учебник: стр. 56-59, № 10-15',
        materials: 'Учебник, тетрадь, таблица Менделеева',
        dayOfWeek: 1,
      ),
      Lesson(
        id: '6',
        title: 'Английский язык',
        time: '11:00-11:45',
        teacher: 'Смирнова Е.А.',
        room: '106',
        description: 'Грамматика. Тема: Времена группы Perfect.',
        homework: 'Учебник: стр. 89-92, упражнения 1-5',
        materials: 'Учебник, тетрадь, словарь',
        dayOfWeek: 1,
      ),
    ],
    // Среда
    [
      Lesson(
        id: '7',
        title: 'Биология',
        time: '9:00-9:45',
        teacher: 'Новикова Т.Д.',
        room: '107',
        description: 'Ботаника. Тема: Строение растений.',
        homework: 'Учебник: стр. 72-75, вопросы 1-10',
        materials: 'Учебник, тетрадь, гербарий',
        dayOfWeek: 2,
      ),
      Lesson(
        id: '8',
        title: 'География',
        time: '10:00-10:45',
        teacher: 'Михайлов И.Г.',
        room: '108',
        description: 'Физическая география. Тема: Климатические пояса Земли.',
        homework: 'Подготовить сообщение о климате Африки',
        materials: 'Учебник, атлас, контурные карты',
        dayOfWeek: 2,
      ),
      Lesson(
        id: '9',
        title: 'Физкультура',
        time: '11:00-11:45',
        teacher: 'Алексеев В.С.',
        room: 'Спортивный зал',
        description: 'Общая физическая подготовка. Тема: Легкая атлетика.',
        homework: 'Тренировка на выносливость',
        materials: 'Спортивная форма, кроссовки',
        dayOfWeek: 2,
      ),
    ],
    // Четверг
    [
      Lesson(
        id: '10',
        title: 'Информатика',
        time: '9:00-9:45',
        teacher: 'Кузнецов А.В.',
        room: '109',
        description: 'Основы программирования. Тема: Циклы в языке Python.',
        homework: 'Написать программу для вычисления факториала числа',
        materials: 'Компьютер, тетрадь',
        dayOfWeek: 3,
      ),
      Lesson(
        id: '11',
        title: 'Русский язык',
        time: '10:00-10:45',
        teacher: 'Федорова Н.М.',
        room: '110',
        description: 'Синтаксис и пунктуация. Тема: Сложноподчиненные предложения.',
        homework: 'Учебник: стр. 112-115, упражнения 200-205',
        materials: 'Учебник, тетрадь',
        dayOfWeek: 3,
      ),
    ],
    // Пятница
    [
      Lesson(
        id: '12',
        title: 'Обществознание',
        time: '9:00-9:45',
        teacher: 'Дмитриева Л.К.',
        room: '111',
        description: 'Право. Тема: Конституция Российской Федерации.',
        homework: 'Подготовить презентацию о правах и обязанностях граждан',
        materials: 'Учебник, тетрадь, Конституция РФ',
        dayOfWeek: 4,
      ),
      Lesson(
        id: '13',
        title: 'ИЗО',
        time: '10:00-10:45',
        teacher: 'Григорьева А.С.',
        room: '112',
        description: 'Рисование. Тема: Натюрморт.',
        homework: 'Нарисовать натюрморт с натуры',
        materials: 'Альбом, карандаши, краски',
        dayOfWeek: 4,
      ),
    ],
  ];

  StudentProfile _studentProfile = StudentProfile(
    name: 'Иван Иванов',
    className: '9А',
    email: 'ivanov@school123.ru',
    phoneNumber: '+7 (999) 123-45-67',
    avatarUrl:
    'https://example.com/avatar.jpg', // Замените на реальный URL аватара
  );

  AppScreen get currentScreen => _currentScreen;
  int get selectedDay => _selectedDay;
  List<NewsItem> get news => _news;
  List<Lesson> get allLessons => _lessonsByDay.expand((dayLessons) => dayLessons).toList();

// Получаем уроки для выбранного дня
  List<Lesson> get lessonsForSelectedDay => _lessonsByDay[_selectedDay];
  StudentProfile get studentProfile => _studentProfile;

  void setScreen(AppScreen screen) {
    if (_currentScreen != screen) {
      _currentScreen = screen;
      notifyListeners();
    }
  }

  void setDay(int day) {
    if (_selectedDay != day) {
      _selectedDay = day;
      notifyListeners();
    }
  }

  void addNewsToBeginning(NewsItem newsItem) {
    _news.insert(0, newsItem);
    notifyListeners();
  }

  void removeNews(String id) {
    _news.removeWhere((news) => news.id == id);
    notifyListeners();
  }

  void addNews(NewsItem newsItem) {
    _news.insert(0, newsItem);
    notifyListeners();
  }

  // Методы для работы с уроками
  void addLesson(Lesson lesson) {
    final day = lesson.dayOfWeek.clamp(0, 4);
    _lessonsByDay[day].add(lesson);
    _sortLessonsByTime(day);
    notifyListeners();
  }

  void updateLesson(Lesson updatedLesson) {
    final day = updatedLesson.dayOfWeek.clamp(0, 4);

    // Если день изменился, перемещаем урок
    if (_isEditingDifferentDay(updatedLesson)) {
      _moveLessonToDifferentDay(updatedLesson);
    } else {
      // Обновляем урок в том же дне
      final index = _lessonsByDay[day].indexWhere((lesson) => lesson.id == updatedLesson.id);
      if (index != -1) {
        _lessonsByDay[day][index] = updatedLesson;
        _sortLessonsByTime(day);
      }
    }
    notifyListeners();
  }

  void deleteLesson(String lessonId) {
    for (int day = 0; day < _lessonsByDay.length; day++) {
      _lessonsByDay[day].removeWhere((lesson) => lesson.id == lessonId);
    }
    notifyListeners();
  }

  bool _isEditingDifferentDay(Lesson updatedLesson) {
    for (int day = 0; day < _lessonsByDay.length; day++) {
      final existingLessonIndex = _lessonsByDay[day].indexWhere((lesson) => lesson.id == updatedLesson.id);
      if (existingLessonIndex != -1 && _lessonsByDay[day][existingLessonIndex].dayOfWeek != updatedLesson.dayOfWeek) {
        return true;
      }
    }
    return false;
  }

  void _moveLessonToDifferentDay(Lesson updatedLesson) {
    // Удаляем из старого дня
    for (int day = 0; day < _lessonsByDay.length; day++) {
      _lessonsByDay[day].removeWhere((lesson) => lesson.id == updatedLesson.id);
    }

    // Добавляем в новый день
    final newDay = updatedLesson.dayOfWeek.clamp(0, 4);
    _lessonsByDay[newDay].add(updatedLesson);
    _sortLessonsByTime(newDay);
  }

  void removeLesson(String id) {
    deleteLesson(id); // Просто вызываем существующий метод
  }

  void _sortLessonsByTime(int day) {
    _lessonsByDay[day].sort((a, b) {
      final aStart = a.time.split('-').first;
      final bStart = b.time.split('-').first;
      return aStart.compareTo(bStart);
    });
  }

  Lesson? getLessonById(String id) {
    for (final dayLessons in _lessonsByDay) {
      try {
        return dayLessons.firstWhere((lesson) => lesson.id == id);
      } catch (e) {
        continue;
      }
    }
    return null;
  }

  void updateStudentProfile({
    String? name,
    String? className,
    String? email,
    String? phoneNumber,
  }) {
    _studentProfile = StudentProfile(
      name: name ?? _studentProfile.name,
      className: className ?? _studentProfile.className,
      email: email ?? _studentProfile.email,
      phoneNumber: phoneNumber ?? _studentProfile.phoneNumber,
      avatarUrl: _studentProfile.avatarUrl,
    );
    notifyListeners();
  }
}