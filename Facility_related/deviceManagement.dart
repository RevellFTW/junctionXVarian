import '../Machine_related/machine.dart';

class deviceManagement {
  List<Machine> devices = [];

  deviceManagement() {
    this.devices = initDevicePark();
  }

  void plannedMachineMaintenance(Machine machine) {
    machine.inMaint = true;
  }

  void machineRepair(Machine machine) {
    machine.isBroken = true;
  }

  void machineMonitoring(Machine machine) {
    if (machine.inMaint || machine.reserved || machine.isBroken)
      machine.available = false;
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
