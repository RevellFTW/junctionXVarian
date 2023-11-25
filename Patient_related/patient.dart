import 'dart:ffi';
import 'appointment.dart';
import 'treatment.dart';
import '../Machine_related/conditions.dart';

class Patient {
  late String name = '';
  late DateTime DoB; //date of birth
  late Char gender; //M/F necessary for room booking
  late Condition condition;
  late Treatment treatment; //class defined in folder
  late bool
      assistance; //difficulty moving, needs assistance, consider while booking
  late bool inPatient; //is in the facility
  late bool largeBodied;
  int priority = -1;
  late List<Appointment> pastAppointments;
  String preferredSlot = slots.none.toString();

  Patient() {
    //...init with input data

    this.treatment = Treatment(this.condition);
    if (this.largeBodied)
      treatment.machines.remove((element) => element.type == "VB");
    // VitalBeam not compatible with largebodied patients

    //prio based on condition probability and other factors to consider
    switch (this.condition.probability) {
      case >= 15:
        this.priority = 3;
        break;
      case >= 10:
        this.priority = 4;
        break;
      default:
        this.priority = 5;
        break;
    }
    if (this.inPatient)
      priority--; //increase prio for inpatients above walk-ins
    if (this.pastAppointments.any((element) => element.cancelled))
      priority--; //if someone had a cancelled/missed appointment the prio increases
  }
}
