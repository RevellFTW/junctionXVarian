//can be used as a selector by the physician

// ignore_for_file: constant_identifier_names

import 'conditions.dart';

enum Conditions {
  Craniospinal,
  Breast,
  Breast_Special,
  Head_and_Neck,
  Abdomen,
  Pelvis,
  Crane,
  Lung,
  Lung_Special,
  Whole_Brain,
}

void initConditions() {
  for (int i = 0; i < Conditions.values.length; i++) {
    Condition(Conditions.values[i].toString());
  }
}
