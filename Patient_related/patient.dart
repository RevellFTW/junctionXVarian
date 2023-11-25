import 'dart:ffi';
import 'appointment.dart';
import 'treatment.dart';

class Patient {
  late String name = '';
  late DateTime DoB; //date of birth
  late Char gender; //M/F necessary for booking
  late Treatment treatment; //class defined in folder
  late bool
      assistance; //difficulty moving, needs assistance, consider while booking
  late bool inPatient; //is in the facility
  late bool largeBodied;
  late int priority;
  late List<Appointment> pastAppoinents;

  Patient() {}
}
