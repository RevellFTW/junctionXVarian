// ignore_for_file: prefer_initializing_formals, non_constant_identifier_names

import 'treatment.dart';
import '../Machine_related/machine.dart';
import 'patient.dart';
import '../exec.dart';

enum Slots {
  none,
  morning,
  daytime,
  afterwork,
}

class Appt {
  late DateTime start;
  late DateTime end;
  late Patient patient;
  late Duration duration;
  late Machine machine;
  late Treatment treatment;
  late bool cancelled = false;
  late bool slotBlocker = false;

  Appt(Patient patient) {
    patient = patient;
    duration = patient.treatment.duration;
    treatment = patient.treatment;
    machine = findMachine(treatment);
    end = start.add(duration);
  }

  Appt.Maint(Machine machine) {
    slotBlocker = true;
    machine = machine;
    machine.available = false;
    const duration = Duration(days: 2);
    end = start.add(duration);
  }

  Appt.Repair(Machine machine) {
    slotBlocker = true;
    duration = machine.timeToFix;
    machine = machine;
    machine.available = false;
    end = start.add(duration);
  }

  Appt.Cancelled(Patient patient) {
    cancelled = true;
    patient.pastAppointments.add(this);
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

  void registerTreatment(Appt appointment) {
    if (DateTime.now() == appointment.end && !appointment.cancelled) {
      appointment.patient.pastAppointments.add(appointment);
      appointment.patient.treatment.progress++;
      appointment.machine.usage += appointment.duration;
    }
  }

  void cancelAppointment(Appt appointment) {
    appointment.cancelled = true;
  }
}
