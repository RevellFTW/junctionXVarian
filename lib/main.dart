import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:varian_app/screens/homescreen.dart';

import 'logic/package.dart';
import 'screens/assignpatient.dart';

class CustomAppointmentDataSource extends CalendarDataSource {
  CustomAppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}

List<Appointment> getAppointmentsFromData(List<Appt> appointmentData) {
  return appointmentData.map((data) {
    return Appointment(
      startTime: data.start,
      endTime: data.end,
    );
  }).toList();
}

List<Appt> getCustomAppointmentData() {
  return <Appt>[
    Appt.Template(DateTime.now(), Duration(hours: 1)),
    Appt.Template(DateTime.now().add(Duration(days: 1)), Duration(hours: 1)),
    // Add more appointment data as needed
  ];
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     List<Appt> myAppointments = getCustomAppointmentData();

//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Custom Appointments Calendar'),
//         ),
//         body: SfCalendar(
//           view: CalendarView.week,
//           dataSource: getAppointmentsFromData(myAppointments),
//         ),
//       ),
//     );
//   }
// }

List<Appointment> convertToAppointments(List<Appt> data) {
  return data.map((item) {
    return Appointment(
      startTime: item.start,
      endTime: item.end,
    );
  }).toList();
}

void main() {
  List<Appt> myAppointments = getCustomAppointmentData();
  List<Appointment> appointments = convertToAppointments(myAppointments);

  CustomAppointmentDataSource dataSource =
      CustomAppointmentDataSource(appointments);

  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Appointments Calendar'),
        ),
        body: SfCalendar(
          view: CalendarView.week,
          dataSource: dataSource,
          allowDragAndDrop: true,
        ),
      ),
    ),
  );
}
