class Condition{

  String name='';
  String rawName='';
  int probability=0; //probability of condition in percent
  late List<String> suitableMachines;

  Condition(String type)
  {
    this.rawName=type;
    this.name=type.replaceAll('_', ' ');
    switch (type) {
    case 'Craniospinal':
      this.probability=1;
      this.suitableMachines= ['TB']; 
      break;
    case 'Breast':
      this.probability=25;      
      this.suitableMachines= ['TB', 'U']; 
      break;
    case 'Breast_Special':
      this.probability=5;
      this.suitableMachines= ['TB']; 
      break;
    case 'Head_and_Neck':
      this.probability=10;
      this.suitableMachines= ['TB', 'VB']; 
      break;
    case 'Abdomen':
      this.probability=10;
      this.suitableMachines= ['TB']; 
      break;
    case 'Pelvis':
      this.probability=18;
      this.suitableMachines= ['TB', 'VB']; 
      break;
    case 'Crane':
      this.probability=4;
      this.suitableMachines= ['TB', 'VB']; 
      break;
    case 'Lung':
      this.probability=12;
      this.suitableMachines= ['TB']; 
      break;
    case 'Lung_Special':
      this.probability=5;
      this.suitableMachines= ['TB']; 
      break;
    case 'Whole_Brain':
      this.probability=10;
      this.suitableMachines= ['TB', 'VB', 'U'];
      break;      
    }
  }

}


