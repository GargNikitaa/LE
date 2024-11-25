//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/loading.dart';
import 'package:provider/provider.dart';
import 'screens/language_provider.dart';
import 'screens/ipc_section_screen.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LanguageProvider>(
          create: (_) => LanguageProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LegalEase',
      debugShowCheckedModeBanner: false,
      home:  LoadingScreen(),
      routes: {
        // '/settings': (context) => const SettingsScreen(),
        '/ipc': (context) => const IPCSectionScreen(),
      },
    );
  }
}