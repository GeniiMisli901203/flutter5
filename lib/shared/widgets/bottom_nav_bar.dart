// lib/shared/widgets/bottom_nav_bar.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../state/app_state.dart';

class BottomNavBar extends StatelessWidget {
  final AppScreen currentScreen;
  final Function(AppScreen) onTabSelected;

  const BottomNavBar({
    required this.currentScreen,
    required this.onTabSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentScreen.index,
      onTap: (index) {
        final screen = AppScreen.values[index];
        onTabSelected(screen);

        // Навигация с помощью GoRouter
        switch (screen) {
          case AppScreen.news:
            context.go('/news');
            break;
          case AppScreen.schedule:
            context.go('/schedule');
            break;
          case AppScreen.profile:
            context.go('/profile');
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.article),
          label: 'Новости',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.schedule),
          label: 'Расписание',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Профиль',
        ),
      ],
    );
  }
}