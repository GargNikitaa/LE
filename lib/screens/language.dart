// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'language_provider.dart';
// import 'chat.dart';

// class LanguageSelectionScreen extends StatelessWidget {
//   const LanguageSelectionScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final languageProvider = Provider.of<LanguageProvider>(context);

//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color(0xFF0A1172),
//               Color(0xFF001970),
//               Color(0xFF003366),
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(height: 40),
//               FutureBuilder<String>(
//                 future: languageProvider.translateText("Select Language"),
//                 builder: (context, snapshot) {
//                   return Text(
//                     snapshot.data ?? "Loading...",
//                     style: const TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   );
//                 },
//               ),
//               const SizedBox(height: 30),
//               // Language Options
//               Expanded(
//                 child: ListView(
//                   children: [
//                     buildLanguageOption(context, "en", "English"),
//                     buildLanguageOption(context, "hi", "Hindi"),
//                     buildLanguageOption(context, "ta", "Tamil"),
//                     buildLanguageOption(context, "ur", "Urdu"),
//                     buildLanguageOption(context, "es", "Spanish"),
//                   ],
//                 ),
//               ),
//               // Continue Button
//               ElevatedButton(
//                 onPressed: () {
//                   // Navigator.of(context).push(
//                   //   MaterialPageRoute(
//                   //     builder: (context) => ChatScreen(),
//                   //   ),
//                   // );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   elevation: 10,
//                   shadowColor: Colors.black54,
//                 ),
//                 child: FutureBuilder<String>(
//                   future: languageProvider.translateText("Continue"),
//                   builder: (context, snapshot) {
//                     return Text(
//                       snapshot.data ?? "Loading...",
//                       style: const TextStyle(fontSize: 16, color: Colors.white),
//                     );
//                   },
//                 ),
//               ),
//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildLanguageOption(BuildContext context, String code, String language) {
//     final languageProvider = Provider.of<LanguageProvider>(context);

//     return GestureDetector(
//       onTap: () {
//         languageProvider.setLanguage(code);
//       },
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 8),
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//         decoration: BoxDecoration(
//           color: languageProvider.selectedLanguage == code
//               ? Colors.lightBlueAccent.shade100
//               : Colors.transparent,
//           borderRadius: BorderRadius.circular(30),
//           border: Border.all(
//             color: Colors.white.withOpacity(0.2),
//             width: 1.5,
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Text(
//               language,
//               style: const TextStyle(
//                 fontSize: 18,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
