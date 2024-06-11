// Written by Juan Pablo Gutierrez
// 10 06 2024

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
  final Function(String) onDateChanged;
  const Calendar({required this.onDateChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: CalendarDatePicker2(
        config: CalendarDatePicker2Config(
          calendarType: CalendarDatePicker2Type.single,
        ),
        value: [DateTime.now()],
        onValueChanged: (date) {
          onDateChanged(date.toString().substring(1, 11));
        },
      ),
    );
  }
}
