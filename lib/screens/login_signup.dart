import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';

class LoginSignUp extends StatelessWidget {
  const LoginSignUp({super.key});

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Welcome back!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                  fontFamily: 'Serif', // Choose a more elegant font
                ),
              ),
              const SizedBox(height: 40),
              
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpScreen()), // Navigate to SignUp screen
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  shadowColor: Colors.black.withOpacity(0.5),
                  elevation: 8,
                ),
                icon: const Icon(Icons.login_rounded, size: 24, color: Colors.white),
                label: const Text(
                  'SIGN UP',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              
              const SizedBox(height: 20),

              OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()), // Navigate to SignUp screen
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white, width: 2),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  shadowColor: Colors.black.withOpacity(0.2),
                  elevation: 8,
                ),
                icon: const Icon(Icons.person_add_alt_1_rounded, size: 24, color: Colors.white),
                label: const Text(
                  'LOG IN',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Add a subtle divider or tagline
              const Text(
                'Or continue with social media',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialIcon(Icons.facebook_rounded, Colors.blue),
                  const SizedBox(width: 20),
                  _buildSocialIcon(Icons.g_mobiledata_rounded, Colors.redAccent),
                  const SizedBox(width: 20),
                  _buildSocialIcon(Icons.apple_rounded, Colors.black),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget to create social media icons
  Widget _buildSocialIcon(IconData iconData, Color color) {
    return InkWell(
      onTap: () {
        // Handle social media action
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Icon(
          iconData,
          color: color,
          size: 30,
        ),
      ),
    );
  }
}

