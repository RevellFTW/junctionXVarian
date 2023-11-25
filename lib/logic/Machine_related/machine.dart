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
      Duration(hours: 4); // time left to fix and be available again
  late List suitableFor; //treatments the machine is suitable for
  Duration usage =
      Duration(minutes: 0); // use time recorded in minutes for statistics

  Machine.Empty() {}

  Machine(String type, int instance) {
    this.type = type;
    switch (type) {
      case 'TB':
        this.name = 'TrueBeam';
        this.Id = type + instance.toString();
        this.suitableFor = [
          [Conditions].removeLast()
        ];
        break;
      case 'VB':
        this.name = 'VitalBeam:';
        this.Id = type + instance.toString();
        this.suitableFor = [
          [Conditions][3],
          [Conditions][5],
          [Conditions][6],
          [Conditions][9]
        ];
        break;
      case 'U':
        this.name = 'Unique - Clinac 1 energy';
        this.Id = type;
        this.suitableFor = [
          [Conditions][0],
          [Conditions][9]
        ];
        break;
    }
  }
}
