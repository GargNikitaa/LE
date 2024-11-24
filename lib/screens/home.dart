import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'chat.dart';
import 'ipc_section_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: unused_field
  int _currentSlideIndex = 0;
  final List<String> imgList = [
    'assets/police_station_1.jpg',
    'assets/police_station_2.jpg',
    'assets/police_station_3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full-screen image header with CTA
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: double.infinity,
                  autoPlay: true,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentSlideIndex = index;
                    });
                  },
                ),
                items: imgList.map((imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(imagePath, fit: BoxFit.cover),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black.withOpacity(0.6),
                                  Colors.transparent,
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                          ),
                          // Removed the text here
                        ],
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ),

          // Main Body
          Positioned(
            top: MediaQuery.of(context).size.height * 0.45,
            left: 0,
            right: 0,
            child: SingleChildScrollView( // Added SingleChildScrollView
              padding: EdgeInsets.only(top: 30.0), // Adjusted padding to avoid overflow
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8.0,
                      offset: Offset(0, -3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Two Primary Action Buttons
                    _buildActionButton(
                      context,
                      icon: Icons.info_outline,
                      title: 'IPC Section Info',
                      description: 'Get detailed information on IPC Sections.',
                      onPressed: () {
            //             Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => IPCListingScreen()),
            // );
                      },
                    ),
                    SizedBox(height: 20),
                    _buildActionButton(
                      context,
                      icon: Icons.chat_bubble_outline,
                      title: 'Connect with Chatbot',
                      description: 'Start a conversation with our legal chatbot.',
                      onPressed: () {
                        Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatScreen()), // Navigate to SignUp screen
                  );
                      },
                    ),

                    SizedBox(height: 10),

                    // Feature Section: Why we use LegalEase?
                    Center(
                      child: Text(
                        'Why Use LegalEase?',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A237E),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildFeatureCard(
                          title: 'Make FIR Easy',
                          imagePath: 'assets/fir_image.jpg', // Replace with your image
                        ),
                        _buildFeatureCard(
                          title: 'Best Accuracy',
                          imagePath: 'assets/accuracy_image.jpg', // Replace with your image
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Custom Action Button Widget
  Widget _buildActionButton(BuildContext context,
      {required IconData icon, required String title, required String description, required Function onPressed}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        elevation: 4,
      ),
      onPressed: () => onPressed(),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 30),
          SizedBox(width: 15),
          Expanded( // Use Expanded to prevent overflow
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Custom Feature Card Widget
  Widget _buildFeatureCard({required String title, required String imagePath}) {
    return Container(
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.1),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A237E),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
