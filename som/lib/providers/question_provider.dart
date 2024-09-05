import 'package:flutter/material.dart';

class QuestionProvider with ChangeNotifier {
  bool _isTapped = false;

  bool get isTapped => _isTapped;

  void toggleTap() {
    _isTapped = !_isTapped;
    notifyListeners();
  }
}
