class Condition {
  String name = '';
  String rawName = '';
  int probability = 0; //probability of condition in percent
  late List<String> suitableMachines;
  late List<int> fractionationOptions;

  Condition(String type) {
    rawName = type;
    name = type.replaceAll('_', ' ');
    switch (type) {
      case 'Craniospinal':
        probability = 1;
        suitableMachines = ['TB'];
        fractionationOptions = [13, 17, 20, 30];
        break;
      case 'Breast':
        probability = 25;
        suitableMachines = ['TB', 'U'];
        fractionationOptions = [15, 19, 25, 30];
        break;
      case 'Breast_Special':
        probability = 5;
        suitableMachines = ['TB'];
        fractionationOptions = [15, 19, 25, 30];
        break;
      case 'Head_and_Neck':
        probability = 10;
        suitableMachines = ['TB', 'VB'];
        fractionationOptions = [5, 10, 15, 25, 30, 33, 35];
        break;
      case 'Abdomen':
        probability = 10;
        suitableMachines = ['TB'];
        fractionationOptions = [1, 3, 5, 8, 10, 12, 15, 18, 20, 30];
        break;
      case 'Pelvis':
        probability = 18;
        suitableMachines = ['TB', 'VB'];
        fractionationOptions = [1, 3, 5, 10, 15, 22, 23, 25, 28, 35];
        break;
      case 'Crane':
        probability = 4;
        suitableMachines = ['TB', 'VB'];
        fractionationOptions = [1, 5, 10, 13, 25, 30];
        break;
      case 'Lung':
        probability = 12;
        suitableMachines = ['TB'];
        fractionationOptions = [1, 5, 10, 15, 20, 25, 30, 33];
        break;
      case 'Lung_Special':
        probability = 5;
        suitableMachines = ['TB'];
        fractionationOptions = [3, 5, 8];
        break;
      case 'Whole_Brain':
        probability = 10;
        suitableMachines = ['TB', 'VB', 'U'];
        fractionationOptions = [5, 10, 12];
        break;
    }
  }
}
