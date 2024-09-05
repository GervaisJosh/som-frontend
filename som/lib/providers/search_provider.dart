import 'package:flutter/material.dart';

class SearchProvider with ChangeNotifier {
  // Private Field's
  bool _searchHasFocus = false;

  // Getter's
  bool get searchHasFocus => _searchHasFocus;

  void toggleSearchFocus() {
    _searchHasFocus = !_searchHasFocus;
    notifyListeners(); // Notify the listeners about the change in state
  }
}
