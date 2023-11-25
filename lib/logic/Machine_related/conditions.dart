class Condition {
  String name = '';
  String rawName = '';
  int probability = 0; //probability of condition in percent
  late List<String> suitableMachines;
  late List<int> fractionationOptions;

  Condition(String type) {
    this.rawName = type;
    this.name = type.replaceAll('_', ' ');
    switch (type) {
      case 'Craniospinal':
        this.probability = 1;
        this.suitableMachines = ['TB'];
        this.fractionationOptions = [13, 17, 20, 30];
        break;
      case 'Breast':
        this.probability = 25;
        this.suitableMachines = ['TB', 'U'];
        this.fractionationOptions = [15, 19, 25, 30];
        break;
      case 'Breast_Special':
        this.probability = 5;
        this.suitableMachines = ['TB'];
        this.fractionationOptions = [15, 19, 25, 30];
        break;
      case 'Head_and_Neck':
        this.probability = 10;
        this.suitableMachines = ['TB', 'VB'];
        this.fractionationOptions = [5, 10, 15, 25, 30, 33, 35];
        break;
      case 'Abdomen':
        this.probability = 10;
        this.suitableMachines = ['TB'];
        this.fractionationOptions = [1, 3, 5, 8, 10, 12, 15, 18, 20, 30];
        break;
      case 'Pelvis':
        this.probability = 18;
        this.suitableMachines = ['TB', 'VB'];
        this.fractionationOptions = [1, 3, 5, 10, 15, 22, 23, 25, 28, 35];
        break;
      case 'Crane':
        this.probability = 4;
        this.suitableMachines = ['TB', 'VB'];
        this.fractionationOptions = [1, 5, 10, 13, 25, 30];
        break;
      case 'Lung':
        this.probability = 12;
        this.suitableMachines = ['TB'];
        this.fractionationOptions = [1, 5, 10, 15, 20, 25, 30, 33];
        break;
      case 'Lung_Special':
        this.probability = 5;
        this.suitableMachines = ['TB'];
        this.fractionationOptions = [3, 5, 8];
        break;
      case 'Whole_Brain':
        this.probability = 10;
        this.suitableMachines = ['TB', 'VB', 'U'];
        this.fractionationOptions = [5, 10, 12];
        break;
    }
  }
}
