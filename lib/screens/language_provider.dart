// import 'package:flutter/material.dart';
// import 'package:translator/translator.dart';

// class LanguageProvider extends ChangeNotifier {
//   String _selectedLanguage = 'en'; // Default language is English
//   final GoogleTranslator _translator = GoogleTranslator();

//   String get selectedLanguage => _selectedLanguage;

//   void setLanguage(String languageCode) {
//     _selectedLanguage = languageCode;
//     notifyListeners();
//   }

//   Future<String> translateText(String text) async {
//     final translatedText = await _translator.translate(text, to: _selectedLanguage);
//     return translatedText.text;
//   }
// }