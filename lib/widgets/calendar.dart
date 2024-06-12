// Written by Juan Pablo Gutierrez
// 10 06 2024

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  final Function(String) onDateChanged;
  const Calendar({required this.onDateChanged, super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  List<DateTime?> _singleDatePickerValueWithDefaultValue = [DateTime.now()];

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
        value: _singleDatePickerValueWithDefaultValue,
        onValueChanged: (date) {
          setState(() {
            _singleDatePickerValueWithDefaultValue = date;
          });
          widget.onDateChanged(date.toString().substring(1, 11));
        },
      ),
    );
  }
}
