import 'package:flutter/material.dart';
import 'login_signup.dart'; // Ensure this file exists and is correctly implemented.
import 'package:introduction_screen/introduction_screen.dart';

void main() {
  runApp(LegalEaseApp());
}

class LegalEaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoadingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => OnboardingScreen()),
        );
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0A1172),
              Color(0xFF001970),
              Color(0xFF003366),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: const Text(
              'LegalEase',
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.white, // Changed to white for better contrast
                fontWeight: FontWeight.bold,
                fontFamily: 'Serif',
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Making FIR Filing",
            body: "Simple and Accurate",
            image: Center(
              child: Image.asset('assets/slider1.png', height: 175.0),
            ),
            decoration: const PageDecoration(
              titleTextStyle: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              bodyTextStyle: TextStyle(fontSize: 16.0),
            ),
          ),
          PageViewModel(
            title: "Speak or Type",
            body: "in Your Own Language",
            image: Center(
              child: Image.asset('assets/slider2.png', height: 175.0),
            ),
            decoration: const PageDecoration(
              titleTextStyle: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              bodyTextStyle: TextStyle(fontSize: 16.0),
            ),
          ),
          PageViewModel(
            title: "A One-Stop Solution",
            body: "for Reporting and Support",
            image: Center(
              child: Image.asset('assets/slider3.png', height: 175.0),
            ),
            decoration: const PageDecoration(
              titleTextStyle: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              bodyTextStyle: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
        onDone: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginSignUp(), // Ensure LoginSignUp exists.
            ),
          );
        },
        showSkipButton: true,
        skip: const Text("Skip"),
        next: const Icon(Icons.arrow_forward),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.bold)),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Colors.grey,
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}
