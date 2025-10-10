import 'package:flutter/material.dart';
import 'state/app_state.dart';
import 'features/schedule/screens/schedule_screen.dart';
import 'features/news/screens/news_screen.dart'; // Убедись, что путь корректный
import 'features/profile/screens/profile_screen.dart';
import 'shared/widgets/bottom_nav_bar.dart';

class App extends StatelessWidget {
  final AppState appState;
  const App({required this.appState, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Школьное расписание',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: AnimatedBuilder(
          animation: appState,
          builder: (context, _) {
            switch (appState.currentScreen) {
              case AppScreen.news:
                return NewsScreen(news: appState.news, appState: appState);
              case AppScreen.schedule:
                return ScheduleScreen(
                  lessons: appState.lessons,
                  selectedDay: appState.selectedDay,
                  onDaySelected: appState.setDay,
                );
              case AppScreen.profile:
                return ProfileScreen(
                  studentName: 'Иван Иванов',
                  studentClass: '10-А',
                  avatarUrl: 'https://via.placeholder.com/150/0077ff/ffffff?text=ИИ',
                );
              default:
                return ScheduleScreen(
                  lessons: appState.lessons,
                  selectedDay: appState.selectedDay,
                  onDaySelected: appState.setDay,
                );
            }
          },
        ),
        bottomNavigationBar: AnimatedBuilder(
          animation: appState,
          builder: (context, _) {
            return BottomNavBar(
              currentScreen: appState.currentScreen,
              onTabSelected: appState.setScreen,
            );
          },
        ),
      ),
    );
  }
}
