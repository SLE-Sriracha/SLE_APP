import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TODO : 왼쪽 세로 navigation bar
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  var formatter = DateFormat('yyyy-MM-dd');

  List<String> _events = [];
  TextEditingController _eventController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        toolbarHeight: 80,
        title: Text(
          '${_selectedDay.month.toString()}월',
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('My Page'),
              onTap: () {
                Navigator.pushNamed(context, '/mypage');
              },
            ),
            // ListTile(
            //   title: const Text('Item 2'),
            //   onTap: () {
            //     // Update the state of the app.
            //     // ...
            //   },
            // ),
          ],
        ),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.95,
                child: TableCalendar(
                  calendarFormat: _calendarFormat,
                  focusedDay: _focusedDay,
                  firstDay: DateTime(2023),
                  lastDay: DateTime(2030),
                  rowHeight: MediaQuery.of(context).size.height *
                      0.125, // TODO : 몇주가 있는지에 따라서 칸의 크기도 변경해야함
                  locale: 'ko-KR',
                  headerVisible: false,
                  headerStyle: const HeaderStyle(
                    titleCentered: true,
                    formatButtonVisible: false,
                    titleTextStyle: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                    leftChevronVisible: false,
                    rightChevronVisible: false,
                    // leftChevronIcon: Icon(
                    //   Icons.arrow_left,
                    //   size: 40.0,
                    // ),
                    // rightChevronIcon: Icon(
                    //   Icons.arrow_right,
                    //   size: 40.0,
                    // ),
                  ),
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                  onPageChanged: (focusedDay) {
                    setState(() {
                      _focusedDay = focusedDay;
                    });
                  },
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    if (isSameDay(_selectedDay, selectedDay)) {
                      setState(() {
                        // _isAddingEvent = true;
                      });
                      // _openAddEventWindow(context);
                    } else {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    }
                  },
                  calendarStyle: CalendarStyle(
                    defaultDecoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.grey[200],
                    ),
                    selectedDecoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    todayDecoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                  ),
                  calendarBuilders: CalendarBuilders(
                    defaultBuilder: (context, date, focusedDay) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Spacer(
                            flex: 1,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${date.day}',
                            style: TextStyle(
                              color: isSameDay(_selectedDay, date)
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Center(
                            child: Text(
                              'Events',
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ]),
      floatingActionButton: SizedBox(
        width: 50,
        height: 50,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            setState(() {});
            // _openAddEventWindow(context);
            // TODO : navigate to add schedule page
          },
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
