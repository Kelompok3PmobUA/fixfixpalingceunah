import 'package:flutter/material.dart';
import 'package:project/screens/editprofilepage.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:project/screens/home.dart';
import 'package:project/screens/social_page.dart';
import 'package:intl/intl.dart';
import '../utilities/publicAppBar.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({super.key, required this.items});

  final List<ListTile> items;

  @override
  State<CalenderPage> createState() => _CalenderPage();
}

class _CalenderPage extends State<CalenderPage> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: PublicAppBar(),
        preferredSize: Size.fromHeight(85),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2010, 10, 20),
              lastDay: DateTime.utc(2040, 10, 20),
              focusedDay: today,
              headerVisible: true,
              daysOfWeekVisible: true,
              sixWeekMonthsEnforced: true,
              shouldFillViewport: false,
              selectedDayPredicate: (day) => isSameDay(day, today),
              availableGestures: AvailableGestures.all,
              onDaySelected: _onDaySelected,
              headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w800)),
              calendarStyle: CalendarStyle(
                  todayTextStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
            Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF2585DE),
                        Color(0xFFA4D3FF),
                      ]),
                ),
                height: 80,
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                alignment: Alignment.center,
                child: Text(DateFormat.yMMMMEEEEd().format(DateTime.now()),
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: Color.fromARGB(255, 255, 255, 255)))),
            Expanded(
              child: Column(
                children: [
                  Container(
                      height: 50,
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                      alignment: Alignment.center,
                      child: Text("task1")),
                  Container(
                      height: 50,
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                      alignment: Alignment.center,
                      child: Text("task2")),
                  Container(
                      height: 50,
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                      alignment: Alignment.center,
                      child: Text("task3")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
