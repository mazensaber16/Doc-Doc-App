import 'package:flutter/material.dart';

class AppointmentProvider with ChangeNotifier {
  DateTime _selectedDate = DateTime.now();
  String? _selectedTime;
  String _selectedOption = 'In Person';
  int _activeStep = 0;

  DateTime get selectedDate => _selectedDate;
  String? get selectedTime => _selectedTime;
  String get selectedOption => _selectedOption;
  int get activeStep => _activeStep;

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void setSelectedTime(String time) {
    _selectedTime = time;
    notifyListeners();
  }

  void setSelectedOption(String option) {
    _selectedOption = option;
    notifyListeners();
  }

  void setActiveStep(int step) {
    _activeStep = step;
    notifyListeners();
  }
}
