//import 'dart:ffi';
import 'bed.dart';

class Room {
  late int Id;
  late int numberOfBeds;
  late int freeBeds;
  //late Char gender;
  late bool accessible; // no stairs, treatment room close by
  late bool bathroom;
  late List<Bed> beds;

  Room() {}
}
