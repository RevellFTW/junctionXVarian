import 'treatment.dart';
import '../Machine_related/machine.dart';
import 'patient.dart';
import '../exec.dart';

class Appointment {
  late DateTime start;
  late DateTime end;
  late Patient patient;
  late Duration duration;
  late Machine machine;
  late Treatment treatment;
  late bool cancelled = false;
  late bool slotBlocker = false;

  Appointment(Patient patient) {
    this.patient = patient;
    this.duration = patient.treatment.duration;
    this.treatment = patient.treatment;
    this.machine = findMachine(this.treatment);
    this.end = this.start.add(this.duration);
  }

  Appointment.Maint(Machine machine) {
    this.slotBlocker = true;
    this.machine = machine;
    machine.available = false;
    this.duration = Duration(days: 2);
    this.end = this.start.add(this.duration);
  }

  Appointment.Repair(Machine machine) {
    this.slotBlocker = true;
    this.duration = machine.timeToFix;
    this.machine = machine;
    machine.available = false;
    this.end = this.start.add(this.duration);
  }

  Machine findMachine(Treatment treatment) {
    Machine idealChoice = Machine.Empty();
    for (int i = 0; i < treatment.machines.length; i++) {
      if (devMan.availableDevices
          .any((element) => element == treatment.machines[i])) {
        idealChoice = devMan.availableDevices
            .firstWhere((element) => element == treatment.machines[i]);
        i = treatment.machines.length;
        devMan.availableDevices.remove(idealChoice);
      } else {
        idealChoice = Machine.Empty();
      }
    }
    return idealChoice;
  }

  void reserveMachine(Machine machine) {
    machine.reserved = true;
  }

  void createBooking() {}

  void registerTreatment(Appointment appointment) {
    if (DateTime.now() == appointment.end && !appointment.cancelled) {
      appointment.patient.pastAppointments.add(appointment);
      appointment.patient.treatment.progress++;
      appointment.machine.usage += appointment.duration;
    }
  }

  void cancelAppointment(Appointment appointment) {
    appointment.cancelled = true;
  }
}
