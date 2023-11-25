// ignore_for_file: file_names

import '../Machine_related/machine.dart';
import '../Patient_related/appointment.dart';

// ignore: camel_case_types
class deviceManagement {
  List<Machine> devices = [];
  List<Machine> availableDevices = [];

  deviceManagement() {
    devices = initDevicePark();
    availableDevices = devices;
  }

  void plannedMachineMaintenance(Machine machine) {
    machine.inMaint = true;
    var maintSlot = Appt.Maint(machine);
  }

  void machineRepair(Machine machine) {
    machine.isBroken = true;
    var repairSlot = Appt.Repair(machine);
  }

  void machineMonitoring(Machine machine) {
    if (machine.inMaint || machine.reserved || machine.isBroken) {
      machine.available = false;
      availableDevices.remove(machine);
    }
  }

  List<Machine> initDevicePark() {
    List<Machine> devices = [];
    devices.add(Machine('TB', 1));
    devices.add(Machine('TB', 2));
    devices.add(Machine('VB', 1));
    devices.add(Machine('VB', 2));
    devices.add(Machine('U', 1));
    return devices;
  }
}
