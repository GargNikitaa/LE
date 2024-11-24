// import 'package:flutter/material.dart';

// class IPCSectionScreen extends StatelessWidget {
//   const IPCSectionScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('IPC Sections'),
//         backgroundColor: const Color(0xFF0A1172),
//       ),
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
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 30),
//               // IPC Section Title
//               _buildSectionTitle(),
//               const SizedBox(height: 35),
//               // Offense Details
//               _buildOffenseDetails(),
//               const SizedBox(height: 35),
//               // Circumstances List
//               _buildCircumstanceText('1. Against her will: Without the woman\'s voluntary consent.'),
//               _buildCircumstanceText('2. Without her consent: If the woman does not consent to the act.'),
//               _buildCircumstanceText('3. Consent obtained through fear of injury or death.'),
//               _buildCircumstanceText('4. Impersonating her husband.'),
//               _buildCircumstanceText('5. Consent given by a woman of unsound mind or intoxicated state.'),
//               _buildCircumstanceText('6. Underage consent: If the woman is under 18.'),
//               const SizedBox(height: 35),
//               // Exceptions
//               _buildExceptions(),
//               const SizedBox(height: 35),
//               // Punishment
//               _buildPunishment(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSectionTitle() {
//     return const Text(
//       'IPC Section 375 - Rape',
//       style: TextStyle(
//         fontSize: 28,
//         fontWeight: FontWeight.bold,
//         color: Colors.white,
//       ),
//     );
//   }

//   Widget _buildOffenseDetails() {
//     return const Text(
//       'Offense: According to the Indian Penal Code, Section 375 defines rape as sexual intercourse with a woman under any of the following circumstances:',
//       style: TextStyle(
//         fontSize: 16,
//         color: Colors.white70,
//       ),
//     );
//   }

//   Widget _buildExceptions() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Exceptions:',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           '• Sexual intercourse by a man with his own wife, if she is not under 18 years of age, is not considered rape under this section.',
//           style: TextStyle(
//             fontSize: 16,
//             color: Colors.white70,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildPunishment() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Punishment:',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           'The punishment for rape under Section 375 is rigorous imprisonment of not less than 7 years, which may extend to life imprisonment, and the offender shall also be liable to pay a fine.',
//           style: TextStyle(
//             fontSize: 16,
//             color: Colors.white70,
//           ),
//         ),
//       ],
//     );
//   }

//   // Helper method to create a styled list item
//   Widget _buildCircumstanceText(String text) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             '• ',
//             style: TextStyle(color: Colors.white70),
//           ),
//           Expanded(
//             child: Text(
//               text,
//               style: const TextStyle(color: Colors.white70, fontSize: 16),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
