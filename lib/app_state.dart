import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<AvailabilityStruct> _availability = [];
  List<AvailabilityStruct> get availability => _availability;
  set availability(List<AvailabilityStruct> _value) {
    _availability = _value;
  }

  void addToAvailability(AvailabilityStruct _value) {
    _availability.add(_value);
  }

  void removeFromAvailability(AvailabilityStruct _value) {
    _availability.remove(_value);
  }

  void removeAtIndexFromAvailability(int _index) {
    _availability.removeAt(_index);
  }

  void updateAvailabilityAtIndex(
    int _index,
    AvailabilityStruct Function(AvailabilityStruct) updateFn,
  ) {
    _availability[_index] = updateFn(_availability[_index]);
  }

  void insertAtIndexInAvailability(int _index, AvailabilityStruct _value) {
    _availability.insert(_index, _value);
  }
}
