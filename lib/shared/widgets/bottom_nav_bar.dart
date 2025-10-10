import 'package:flutter/material.dart';
import '../../state/app_state.dart';

class BottomNavBar extends StatelessWidget {
  final AppScreen currentScreen;
  final Function(AppScreen) onTabSelected;

  const BottomNavBar({
    required this.currentScreen,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentScreen.index,
      onTap: (index) => onTabSelected(AppScreen.values[index]),
      items: [
        BottomNavigationBarItem(
          icon: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: currentScreen == AppScreen.news
                  ? Colors.blue.withOpacity(0.1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.article,
              color: currentScreen == AppScreen.news
                  ? Colors.blue
                  : Colors.grey,
            ),
          ),
          label: 'Новости',
        ),
        BottomNavigationBarItem(
          icon: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: currentScreen == AppScreen.schedule
                  ? Colors.blue.withOpacity(0.1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.schedule,
              color: currentScreen == AppScreen.schedule
                  ? Colors.blue
                  : Colors.grey,
            ),
          ),
          label: 'Расписание',
        ),
        BottomNavigationBarItem(
          icon: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: currentScreen == AppScreen.profile
                  ? Colors.blue.withOpacity(0.1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.person,
              color: currentScreen == AppScreen.profile
                  ? Colors.blue
                  : Colors.grey,
            ),
          ),
          label: 'Профиль',
        ),
      ],
    );
  }
}