import 'package:flutter/material.dart';

class DaySelector extends StatelessWidget {
  final int selectedDay;
  final Function(int) onDaySelected;

  const DaySelector({
    required this.selectedDay,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    final days = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт'];

    return Container(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onDaySelected(index),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: selectedDay == index
                    ? Colors.blue
                    : Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: selectedDay == index
                      ? Colors.blue
                      : Colors.transparent,
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  days[index],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: selectedDay == index
                        ? Colors.white
                        : Colors.grey,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}