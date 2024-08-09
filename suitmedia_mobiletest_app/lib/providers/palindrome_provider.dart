import 'package:flutter/material.dart';

class PalindromeProvider extends ChangeNotifier {
  String _name = '';
  String _selectedUserName = '';

  String get name => _name;
  String get selectedUserName => _selectedUserName;

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setSelectedUserName(String selectedUserName) {
    _selectedUserName = selectedUserName;
    notifyListeners();
  }

  bool isPalindrome(String input) {
    String cleanedInput = input.replaceAll(RegExp(r'\s+'), '').toLowerCase();
    String reversedInput = cleanedInput.split('').reversed.join('');
    return cleanedInput == reversedInput;
  }
}
