import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:varian_app/screens/time_table_screen.dart';

import 'screens/patient_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      theme: ThemeData(useMaterial3: true),
      routes: {
        '/': (context) => PatientListWidget(),
        '/timetable': (context) => const TimeTableWidget(),
      },
    );
  }
}

class MyAppDataSource extends CalendarDataSource {
  MyAppDataSource({required List<Appointment> appointments}) : super();
}

MyAppDataSource _getCalendarDataSource() {
  final List<Appointment> appointments = <Appointment>[
    Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(Duration(hours: 1)),
      subject: 'Patient 1',
      color: Colors.blue,
    ),
    Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(Duration(hours: 1)),
      subject: 'Patient 1',
      color: Colors.blue,
    ),
    Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(Duration(hours: 1)),
      subject: 'Patient 1',
      color: Colors.blue,
    ),
    // Add more appointments here...
  ];
  return MyAppDataSource(appointments: appointments);
}
