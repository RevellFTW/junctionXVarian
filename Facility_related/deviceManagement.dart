import '../Machine_related/machine.dart';
import '../Patient_related/appointment.dart';

class deviceManagement {
  List<Machine> devices = [];
  List<Machine> availableDevices = [];

  deviceManagement() {
    this.devices = initDevicePark();
    this.availableDevices = devices;
  }

  void plannedMachineMaintenance(Machine machine) {
    machine.inMaint = true;
    var maintSlot = Appointment.Maint(machine);
  }

  void machineRepair(Machine machine) {
    machine.isBroken = true;
    var repairSlot = Appointment.Repair(machine);
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
