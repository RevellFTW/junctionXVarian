// ignore_for_file: non_constant_identifier_names

import 'dart:core';
import 'spectrum.dart';

class Machine {
  var Id = ''; //given in excel
  var type = ''; // which hardware
  var name = '';
  bool available =
      true; // can the machine be used atm (no maint, no breakdown, no reservation)
  bool reserved = false;
  bool inMaint = false; // is being maintained
  bool isBroken = false; // is broken unexpectedly
  late Duration timeToFix =
      const Duration(hours: 4); // time left to fix and be available again
  late List suitableFor; //treatments the machine is suitable for
  Duration usage =
      // ignore: prefer_const_constructors
      Duration(minutes: 0); // use time recorded in minutes for statistics

  Machine.Empty() {}

  Machine(String type, int instance) {
    type = type;
    switch (type) {
      case 'TB':
        name = 'TrueBeam';
        Id = type + instance.toString();
        suitableFor = [
          [Conditions].removeLast()
        ];
        break;
      case 'VB':
        name = 'VitalBeam:';
        Id = type + instance.toString();
        suitableFor = [
          [Conditions][3],
          [Conditions][5],
          [Conditions][6],
          [Conditions][9]
        ];
        break;
      case 'U':
        name = 'Unique - Clinac 1 energy';
        Id = type;
        suitableFor = [
          [Conditions][0],
          [Conditions][9]
        ];
        break;
    }
  }
}
