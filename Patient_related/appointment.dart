import 'treatment.dart';
import '../Machine_related/machine.dart';
import 'patient.dart';

class Appointment {
  late DateTime start;
  late DateTime end;
  late Patient patient;
  late Duration duration;
  late Machine machine;
  late Treatment treatment;
  late bool cancelled;

  Appointment(Patient patient) {
    this.patient = patient;
    this.duration = patient.treatment.duration;
    this.treatment = patient.treatment;
    this.machine = findMachine(this.treatment);
    this.end = this.start.add(this.duration);
  }

  Machine findMachine(Treatment treatment) {
    Machine idealChoice;

    return idealChoice;
  }

  void reserveMachine(Machine machine) {
    machine.reserved = true;
  }

  void createBooking() {}

  void registerTreatment(Appointment appointment) {
    if (DateTime.now() == appointment.end && !appointment.cancelled) {
      appointment.patient.pastAppoinents.add(appointment);
      appointment.patient.treatment.progress++;
      appointment.machine.usage += appointment.duration;
    }
  }

  void cancelAppointment(Appointment appointment) {
    appointment.cancelled = true;
  }
}
