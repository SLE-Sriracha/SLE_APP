import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import '../pages/eventPage.dart';

class calendarComponent extends StatefulWidget {
  @override
  _calendarComponentState createState() => _calendarComponentState();
}

class _calendarComponentState extends State<calendarComponent> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  var formatter = DateFormat('yyyy-MM-dd');

  bool _isAddingEvent = false; 
  List<String> _events = []; 
  TextEditingController _eventController = TextEditingController(); 

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  void _openAddEventWindow(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return EventAdderPage(
          onEventAdded: (eventDetails) {
            print('Event added: $eventDetails');

            setState(() {
              _isAddingEvent = false;
              _events.add(eventDetails); 
              _eventController.clear();
            });

            Navigator.of(context, rootNavigator: true).pop();
          },
        );
      },
    );
  }

  void _deleteEvent(String event) {
    setState(() {
      _events.remove(event); // Remove event from the list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Wrap body with SingleChildScrollView
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                TableCalendar(
                  calendarFormat: _calendarFormat,
                  focusedDay: _focusedDay,
                  firstDay: DateTime(2023),
                  lastDay: DateTime(2030),
                  rowHeight: MediaQuery.of(context).size.height * 0.12,
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
                    if (_isAddingEvent) {
                      return;
                    }

                    if (isSameDay(_selectedDay, selectedDay)) {
                      setState(() {
                        _isAddingEvent = true;
                      });
                      _openAddEventWindow(context);
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
                    todayDecoration: BoxDecoration(
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
                          Column(
                            children: _events
                                .where((event) => isSameDay(date, _selectedDay))
                                .map((event) {
                              return Column(
                                children: [
                                  Text(event),
                                  ElevatedButton(
                                    onPressed: () {
                                      _deleteEvent(event);
                                    },
                                    child: Text('Delete'),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: _isAddingEvent
          ? null
          : FloatingActionButton(
              onPressed: () {
                setState(() {
                  _isAddingEvent = true;
                });
                _openAddEventWindow(context);
              },
              child: Icon(Icons.add),
            ),
      bottomNavigationBar: Container(
        height: 40,
        color: Colors.grey[200],
        child: Center(
          child: Text(
            'Events and Reminders for ${formatter.format(_selectedDay).toString()}',
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
