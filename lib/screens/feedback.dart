import 'package:flutter/material.dart';
import 'home.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  String _selectedFeedback = ''; // To track selected feedback option

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF1A237E),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      resizeToAvoidBottomInset: true, // Avoid overflow when keyboard appears
      body: SingleChildScrollView( // Makes the page scrollable
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How accurately was the section predicted?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _buildFeedbackButton('Accurate'),
                _buildFeedbackButton('Somewhat Accurate'),
                _buildFeedbackButton('Not Accurate'),
                _buildFeedbackButton('Very Useful'),
                _buildFeedbackButton('Somewhat Useful'),
                _buildFeedbackButton('Not Useful'),
              ],
            ),
            SizedBox(height: 30),
            Text(
              'Tell us more about your experience',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 10),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Write your comments here...',
                filled: true,
                fillColor: Colors.lightBlue[50],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()), // Navigate to SignUp screen
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Submit Feedback',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // A helper function to create feedback buttons with selectable behavior
  Widget _buildFeedbackButton(String label) {
    bool isSelected = _selectedFeedback == label; // Check if the button is selected
    return OutlinedButton(
      onPressed: () {
        setState(() {
          _selectedFeedback = label; // Update the selected option
        });
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue[300] : Colors.lightBlue[50], // Change color if selected
        side: BorderSide(color: Colors.blueAccent.shade100),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Text(
          label,
          style: TextStyle(fontSize: 14, color: isSelected ? Colors.white : Colors.black), // Change text color when selected
        ),
      ),
    );
  }
}
