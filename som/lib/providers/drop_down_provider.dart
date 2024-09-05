import 'package:flutter/cupertino.dart';

class DropDownProvider extends ChangeNotifier {
  String? _selectedBusinessCategory;
  final List<String> _businessCategoriesList = [
    'Business Partner',
    'Investor',
    'Business Opportunities',
    'Business Mentor',
  ];

  String? get selectedBusinessCategory => _selectedBusinessCategory;
  List<String>? get businessCategoriesList => _businessCategoriesList;

  void setSelectedBusinessCategory(String? businessType) {
    _selectedBusinessCategory = businessType;
    notifyListeners();
  }

  void resetBusinessCategory() {
    _selectedBusinessCategory = null;
    notifyListeners();
  }
}
