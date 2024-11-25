import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'language_provider.dart';
import 'ipc.dart';

class IPCSectionScreen extends StatefulWidget {
  const IPCSectionScreen({super.key});

  @override
  _IPCSectionScreenState createState() => _IPCSectionScreenState();
}

class _IPCSectionScreenState extends State<IPCSectionScreen> {
  final IPCService _ipcService = IPCService();
  final TextEditingController _sectionController = TextEditingController();
  Map<String, dynamic>? _selectedSection;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await _ipcService.loadIPCData();
    setState(() {
      _isLoading = false;
    });
  }

  void _findSection() {
    final String input = _sectionController.text;
    final int? sectionNumber = int.tryParse(input);

    if (sectionNumber != null) {
      final section = _ipcService.findSection(sectionNumber);
      setState(() {
        _selectedSection = section;
      });
    } else {
      setState(() {
        _selectedSection = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<String>(
          future: languageProvider.translateText("IPC Section Finder"),
          builder: (context, snapshot) {
            return Text(snapshot.data ?? "Loading...");
          },
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder<String>(
                    future: languageProvider.translateText("Enter IPC Section Number:"),
                    builder: (context, snapshot) {
                      return Text(
                        snapshot.data ?? "Loading...",
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _sectionController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: languageProvider.selectedLanguage == 'en' ? 'Section Number' : null,
                      hintText: languageProvider.selectedLanguage == 'en' ? 'e.g., 1, 2, 3' : null,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _findSection,
                    child: FutureBuilder<String>(
                      future: languageProvider.translateText("Find Section"),
                      builder: (context, snapshot) {
                        return Text(snapshot.data ?? "Loading...");
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  _selectedSection == null
                      ? FutureBuilder<String>(
                          future: languageProvider.translateText(
                              "No section found or enter a valid number."),
                          builder: (context, snapshot) {
                            return Text(
                              snapshot.data ?? "Loading...",
                              style: const TextStyle(color: Colors.red, fontSize: 16),
                            );
                          },
                        )
                      : Card(
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FutureBuilder<String>(
                                  future: languageProvider.translateText(
                                      'Section ${_selectedSection!["Section"]}: ${_selectedSection!["section_title"]}'),
                                  builder: (context, snapshot) {
                                    return Text(
                                      snapshot.data ?? "Loading...",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(height: 10),
                                FutureBuilder<String>(
                                  future: languageProvider.translateText(
                                      _selectedSection!["section_desc"]),
                                  builder: (context, snapshot) {
                                    return Text(
                                      snapshot.data ?? "Loading...",
                                      style: const TextStyle(fontSize: 16),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                ],
              ),
            ),
    );
  }
}
