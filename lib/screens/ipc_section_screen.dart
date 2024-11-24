// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'language_provider.dart';
// import 'ipc.dart';

// class IPCListingScreen extends StatefulWidget {
//   const IPCListingScreen({Key? key}) : super(key: key);

//   @override
//   _IPCListingScreenState createState() => _IPCListingScreenState();
// }

// class _IPCListingScreenState extends State<IPCListingScreen> {
//   final IPCService _ipcService = IPCService();
//   final TextEditingController _searchController = TextEditingController();
//   Map<String, dynamic>? _selectedSection;
//   bool _isLoading = true;

//   // Sample IPC Sections for Listing
//   final List<Map<String, String>> ipcSections = [
//     {
//       'section': 'IPC Section 354',
//       'title': 'Assault or Criminal Force to Woman with Intent to Outrage her Modesty',
//       'offense': 'Using criminal force against a woman intending to outrage her modesty.',
//       'punishment': 'Imprisonment up to 5 years, fine, or both.'
//     },
//     {
//       'section': 'IPC Section 354A',
//       'title': 'Sexual Harassment',
//       'offense': 'Unwelcome physical contact, advances, demand for sexual favors.',
//       'punishment': 'Imprisonment up to 3 years or fine.'
//     },
//     {
//       'section': 'IPC Section 375',
//       'title': 'Rape',
//       'offense': 'Sexual intercourse without consent, by force or coercion.',
//       'punishment': 'Rigorous imprisonment not less than 7 years.'
//     },
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _loadData();
//   }

//   Future<void> _loadData() async {
//     await _ipcService.loadIPCData();
//     setState(() {
//       _isLoading = false;
//     });
//   }

//   void _findSection(String sectionNumber) {
//     final int? section = int.tryParse(sectionNumber);
//     if (section != null) {
//       final result = _ipcService.findSection(section);
//       setState(() {
//         _selectedSection = result;
//       });
//     } else {
//       setState(() {
//         _selectedSection = null;
//       });
//     }
//   }

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
//             children: [
//               const SizedBox(height: 40),
//               FutureBuilder<String>(
//                 future: languageProvider.translateText('IPC Sections'),
//                 builder: (context, snapshot) {
//                   return Text(
//                     snapshot.data ?? 'IPC Sections',
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 1.2,
//                     ),
//                     textAlign: TextAlign.center,
//                   );
//                 },
//               ),
//               const SizedBox(height: 20),
//               // Search Bar
//               _buildSearchBar(languageProvider),
//               const SizedBox(height: 20),
//               // List of IPC Sections
//               _isLoading
//                   ? const Center(child: CircularProgressIndicator())
//                   : Expanded(
//                       child: ListView.builder(
//                         itemCount: ipcSections.length,
//                         itemBuilder: (context, index) {
//                           return _buildSectionCard(context, index, languageProvider);
//                         },
//                       ),
//                     ),
//               // Display Selected Section
//               if (_selectedSection != null)
//                 _buildSectionDetailCard(languageProvider),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSearchBar(LanguageProvider languageProvider) {
//     return TextField(
//       controller: _searchController,
//       decoration: InputDecoration(
//         hintText: 'Search IPC Sections',
//         hintStyle: const TextStyle(color: Colors.white70),
//         prefixIcon: const Icon(Icons.search, color: Colors.white70),
//         suffixIcon: IconButton(
//           icon: const Icon(Icons.search, color: Colors.white),
//           onPressed: () {
//             _findSection(_searchController.text);
//           },
//         ),
//         filled: true,
//         fillColor: Colors.white.withOpacity(0.15),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//           borderSide: BorderSide.none,
//         ),
//       ),
//       style: const TextStyle(color: Colors.white),
//     );
//   }

//   Widget _buildSectionCard(
//       BuildContext context, int index, LanguageProvider languageProvider) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => IPCDetailScreen(
//               sectionData: ipcSections[index],
//             ),
//           ),
//         );
//       },
//       child: Card(
//         margin: const EdgeInsets.symmetric(vertical: 10.0),
//         elevation: 8,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 ipcSections[index]['section']!,
//                 style: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blueAccent,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 ipcSections[index]['title']!,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black87,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 'Offense: ${ipcSections[index]['offense']}',
//                 style: const TextStyle(fontSize: 14, color: Colors.grey),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 'Punishment: ${ipcSections[index]['punishment']}',
//                 style: const TextStyle(fontSize: 14, color: Colors.redAccent),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSectionDetailCard(LanguageProvider languageProvider) {
//     return Card(
//       elevation: 4,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             FutureBuilder<String>(
//               future: languageProvider.translateText(
//                   'Section ${_selectedSection!["Section"]}: ${_selectedSection!["section_title"]}'),
//               builder: (context, snapshot) {
//                 return Text(
//                   snapshot.data ?? "Loading...",
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                 );
//               },
//             ),
//             const SizedBox(height: 10),
//             FutureBuilder<String>(
//               future: languageProvider.translateText(_selectedSection!["section_desc"]),
//               builder: (context, snapshot) {
//                 return Text(
//                   snapshot.data ?? "Loading...",
//                   style: const TextStyle(fontSize: 16),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class IPCDetailScreen extends StatelessWidget {
//   final Map<String, String> sectionData;

//   const IPCDetailScreen({Key? key, required this.sectionData}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(sectionData['section']!)),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               sectionData['title']!,
//               style: const TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 16),
//             Text('Offense: ${sectionData['offense']}'),
//             const SizedBox(height: 8),
//             Text('Punishment: ${sectionData['punishment']}'),
//           ],
//         ),
//       ),
//     );
//   }
// }
