import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:varian_app/screens/homescreen.dart';

import 'screens/assignpatient.dart';
import 'logic/package.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AssignPatientWidget(),
    );
  }

  _MyAppDataSource _getCalendarDataSource() {
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
    return _MyAppDataSource(appointments: appointments);
  }
}

class _MyAppDataSource extends CalendarDataSource {
  _MyAppDataSource({required List<Appointment> appointments}) : super();
}
