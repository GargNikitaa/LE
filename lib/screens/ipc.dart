// import 'dart:convert';
// import 'package:flutter/services.dart';
// import 'package:translator/translator.dart';

// class IPCService {
//   List<dynamic>? _ipcData;
//   final GoogleTranslator _translator = GoogleTranslator();

//   // Load JSON Data
//   Future<void> loadIPCData() async {
//     final String jsonString = await rootBundle.loadString('assets/json/ipc.json');
//     _ipcData = json.decode(jsonString);
//   }

//   // Search Section by Number
//   Map<String, dynamic>? findSection(int sectionNumber) {
//     if (_ipcData == null) return null;

//     return _ipcData!.firstWhere(
//       (section) => section['Section'] == sectionNumber,
//       orElse: () => null,
//     );
//   }

//   // Translate Section Details
//   Future<Map<String, dynamic>> translateSection(Map<String, dynamic> section, String languageCode) async {
//     final translatedTitle = await _translator.translate(section['section_title'], to: languageCode);
//     final translatedDesc = await _translator.translate(section['section_desc'], to: languageCode);

//     return {
//       ...section,
//       'section_title': translatedTitle.text,
//       'section_desc': translatedDesc.text,
//     };
//   }
// }