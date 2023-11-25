import '../Machine_related/conditions.dart';
import '../Machine_related/machine.dart';
import '../exec.dart';

class Treatment {
  late String name;
  List<Machine> machines = [];
  late Duration
      duration; //treatment const duration in minutes, can be used directly for booking a slot
  int fractions = 0; // number of fractions to do
  int progress = 0; // number of fractions already done

  Treatment(Condition condition) {
    name = condition.name;
    for (int i = 0; i < condition.suitableMachines.length; i++) {
      for (int j = 0; j < devMan.devices.length; j++) {
        if (condition.suitableMachines[i] == devMan.devices[j].type) {
          machines.add(devMan.devices[j]);
        }
      }
    }

    switch (condition.rawName) {
      case 'Craniospinal':
        const duration = Duration(minutes: 30);
        break;
      case 'Breast':
        const duration = Duration(minutes: 12);
        break;
      case 'Breast_Special':
        const duration = Duration(minutes: 20);
        break;
      case 'Head_and_Neck':
        const duration = Duration(minutes: 12);
        break;
      case 'Abdomen':
        const duration = Duration(minutes: 12);
        break;
      case 'Pelvis':
        const duration = Duration(minutes: 12);
        break;
      case 'Crane':
        const duration = Duration(minutes: 10);
        break;
      case 'Lung':
        const duration = Duration(minutes: 12);
        break;
      case 'Lung_Special':
        const duration = Duration(minutes: 15);
        break;
      case 'Whole_Brain':
        const duration = Duration(minutes: 10);
        break;
    }
  }
}
