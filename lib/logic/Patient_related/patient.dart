import 'dart:ffi';
import 'appointment.dart';
import 'treatment.dart';
import '../Machine_related/conditions.dart';

class Patient {
  late String name = '';
  // ignore: non_constant_identifier_names
  late DateTime DoB; //date of birth
  late Char gender; //M/F necessary for room booking
  late Condition condition;
  late Treatment treatment; //class defined in folder
  late bool
      assistance; //difficulty moving, needs assistance, consider while booking
  late bool inPatient; //is in the facility
  late bool largeBodied;
  int priority = -1;
  late List<Appt> pastAppointments;
  String preferredSlot = Slots.none.toString();

  Patient() {
    //...init with input data

    treatment = Treatment(condition);
    if (largeBodied) {
      treatment.machines.removeWhere((element) => element.type == "VB");
    }
    // VitalBeam not compatible with largebodied patients

    //prio based on condition probability and other factors to consider
    switch (condition.probability) {
      case >= 15:
        priority = 3;
        break;
      case >= 10:
        priority = 4;
        break;
      default:
        priority = 5;
        break;
    }
    if (inPatient) {
      priority--; //increase prio for inpatients above walk-ins
    }
    if (pastAppointments.any((element) => element.cancelled)) {
      priority--; //if someone had a cancelled/missed appointment the prio increases
    }
  }
}
