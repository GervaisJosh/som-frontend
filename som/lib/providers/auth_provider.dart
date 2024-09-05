import 'package:flutter/material.dart';
import '../common_widgets/check_item.dart';

class AuthProvider with ChangeNotifier {
  // Private Field's
  bool _isPassVisible = true;
  bool _isConfPassVisible = true;

  bool _emailHasFocus = false;
  bool _passHasFocus = false;
  bool _confPassHasFocus = false;
  bool _fnHasFocus = false;

  bool _isChecked = false;
  bool _isSignInChecked = false;

  final List<Widget> _expertiseAreacheckItems = [
    const CheckItem(title: 'Marketing', type: 'expertise'),
    const CheckItem(title: 'Sales', type: 'expertise'),
    const CheckItem(title: 'Operations', type: 'expertise'),
    const CheckItem(title: 'Finance', type: 'expertise'),
    const CheckItem(title: 'Product Development', type: 'expertise'),
    const CheckItem(title: 'Legal', type: 'expertise'),
    const CheckItem(title: 'Technology', type: 'expertise'),
  ];

  final List<Widget> _supportTypescheckItems = [
    const CheckItem(title: 'Mentorship', type: 'support'),
    const CheckItem(title: 'Investment', type: 'support'),
    const CheckItem(title: 'Partnership', type: 'support'),
    const CheckItem(title: 'Advisory', type: 'support'),
    const CheckItem(title: 'Networking', type: 'support'),
  ];

  final Map<String, bool> _expertiseAreas = {
    'Marketing': false,
    'Sales': false,
    'Operations': false,
    'Finance': false,
    'Product Development': false,
    'Legal': false,
    'Technology': false,
    'Other': false,
  };

  final Map<String, bool> _supportTypes = {
    'Mentorship': false,
    'Investment': false,
    'Partnership': false,
    'Advisory': false,
    'Networking': false,
    'Other': false,
  };

  // Getter's
  bool get isPassVisible => _isPassVisible;
  bool get isConfPassVisible => _isConfPassVisible;

  bool get emailHasFocus => _emailHasFocus;
  bool get passHasFocus => _passHasFocus;
  bool get confPassHasFocus => _confPassHasFocus;
  bool get fnHasFocus => _fnHasFocus;

  bool get isChecked => _isChecked;
  bool get isSignInChecked => _isSignInChecked;

  Map<String, bool> get expertiseAreas => _expertiseAreas;
  Map<String, bool> get supportTypes => _supportTypes;

  List<Widget> get expertiseAreacheckItems => _expertiseAreacheckItems;
  List<Widget> get supportTypescheckItems => _supportTypescheckItems;

  void addExpertiseArea(String expertise) {
    _expertiseAreas[expertise] = true;
    _expertiseAreacheckItems
        .add(CheckItem(title: expertise, type: 'expertise'));
    notifyListeners();
  }

  void addSupportTypes(String supportType) {
    _supportTypes[supportType] = true;
    _supportTypescheckItems
        .add(CheckItem(title: supportType, type: 'support'));
    notifyListeners();
  }

  // Toggle Operations
  void togglePassVisibility() {
    _isPassVisible = !_isPassVisible;
    notifyListeners(); // Notify the listeners about the change in state
  }

  void toggleConfPassVisibility() {
    _isConfPassVisible = !_isConfPassVisible;
    notifyListeners(); // Notify the listeners about the change in state
  }

  void toggleFullNameFocus() {
    _fnHasFocus = !_fnHasFocus;
    notifyListeners(); // Notify the listeners about the change in state
  }

  void toggleEmailFocus() {
    _emailHasFocus = !_emailHasFocus;
    notifyListeners(); // Notify the listeners about the change in state
  }

  void toggleConfPassFocus() {
    _confPassHasFocus = !_confPassHasFocus;
    notifyListeners(); // Notify the listeners about the change in state
  }

  void togglePassFocus() {
    _passHasFocus = !_passHasFocus;
    notifyListeners(); // Notify the listeners about the change in state
  }

  void toggleCheckbox() {
    _isChecked = !_isChecked;
    notifyListeners(); // Notify the listeners about the change in state
  }

  void toggleSignInCheckbox() {
    _isSignInChecked = !_isSignInChecked;
    notifyListeners(); // Notify the listeners about the change in state
  }

  void disposeCheckbox() {
    _isChecked = false;
    notifyListeners(); // Notify the listeners about the change in state
  }

  void disposeSignInCheckbox() {
    _isSignInChecked = false;
    notifyListeners(); // Notify the listeners about the change in state
  }

  void toggleExpertiseArea(String title) {
    _expertiseAreas[title] = !_expertiseAreas[title]!;
    notifyListeners();
  }

  void toggleSupportType(String title) {
    _supportTypes[title] = !_supportTypes[title]!;
    notifyListeners();
  }
}
