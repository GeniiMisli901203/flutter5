import 'package:flutter/material.dart';
import '../features/schedule/models/lesson.dart';
import '../features/news/models/news_item.dart';

enum AppScreen { news, schedule, profile }

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
      ),
    ],
  ];

  AppScreen get currentScreen => _currentScreen;
  int get selectedDay => _selectedDay;
  List<NewsItem> get news => _news;
  List<Lesson> get lessons => _lessonsByDay[_selectedDay];

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
}
