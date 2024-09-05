import 'package:flutter/material.dart';

class FilterDropDown<T> extends ChangeNotifier {
  T? selectedItem;
  List<T> items = [];
  bool hasOther;

  FilterDropDown({required List<T> items, required this.selectedItem})
      : hasOther = items.contains("Other" as T) {
    this.items = List<T>.from(items); // Make a copy of the items list
    _ensureOtherAtEnd();
  }

  void addItem(T value) {
    items.insert(items.length - (hasOther ? 1 : 0), value);
    notifyListeners();
  }

  void setSelectedItem(T value) {
    selectedItem = value;
    notifyListeners();
  }

  void _ensureOtherAtEnd() {
    if (hasOther) {
      items.remove("Other" as T);
      items.add("Other" as T);
    }
  }

  List<T> get dropdownItems {
    return items;
  }
}
