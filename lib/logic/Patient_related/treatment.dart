import '../Machine_related/conditions.dart';
import '../Machine_related/machine.dart';
import '../exec.dart';

class Treatment {
  late String name;
  List<Machine> machines = [];
  late Duration
      duration; //treatment duration in minutes, can be used directly for booking a slot
  int fractions = 0; // number of fractions to do
  int progress = 0; // number of fractions already done

  Treatment(Condition condition) {
    this.name = condition.name;
    for (int i = 0; i < condition.suitableMachines.length; i++) {
      for (int j = 0; j < devMan.devices.length; j++)
        if (condition.suitableMachines[i] == devMan.devices[j].type) {
          machines.add(devMan.devices[j]);
        }
    }

    switch (condition.rawName) {
      case 'Craniospinal':
        this.duration = Duration(minutes: 30);
        break;
      case 'Breast':
        this.duration = Duration(minutes: 12);
        break;
      case 'Breast_Special':
        this.duration = Duration(minutes: 20);
        break;
      case 'Head_and_Neck':
        this.duration = Duration(minutes: 12);
        break;
      case 'Abdomen':
        this.duration = Duration(minutes: 12);
        break;
      case 'Pelvis':
        this.duration = Duration(minutes: 12);
        break;
      case 'Crane':
        this.duration = Duration(minutes: 10);
        break;
      case 'Lung':
        this.duration = Duration(minutes: 12);
        break;
      case 'Lung_Special':
        this.duration = Duration(minutes: 15);
        break;
      case 'Whole_Brain':
        this.duration = Duration(minutes: 10);
        break;
    }
  }
}
