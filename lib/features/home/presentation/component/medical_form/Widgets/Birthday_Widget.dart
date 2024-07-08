import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:globaladvice_new/core/utils/config_size.dart';
import 'package:globaladvice_new/core/widgets/main_button.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../../core/resource_manger/locale_keys.g.dart';

class BirthdayWidget extends StatefulWidget {
  BirthdayWidget({super.key, this.selectedday});
  String? selectedday;

  @override
  State<BirthdayWidget> createState() => _BirthdayWidgetState();
}

class _BirthdayWidgetState extends State<BirthdayWidget> {
  DateTime focusedday = DateTime.utc(2006, 1, 1);
  CalendarFormat calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                height: ConfigSize.defaultSize! * 50,
                child: Column(
                  children: [
                    TableCalendar(
                        calendarFormat: calendarFormat,
                        sixWeekMonthsEnforced: true,
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            focusedday = focusedDay;
                            widget.selectedday = focusedDay.toString();
                          });
                        },
                        firstDay: DateTime.utc(1950, 1, 1),
                        lastDay: DateTime.utc(2006, 1, 1),
                        focusedDay: focusedday),
                    MainButton(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        title: StringManager.done.tr()),
                  ],
                ),
              );
            },
          );
        },
        icon: Icon(Icons.calendar_today));
  }
}
