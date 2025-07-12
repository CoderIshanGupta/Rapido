import 'package:flutter/material.dart';

class RatingFeedbackScreen extends StatefulWidget {
  @override
  _RatingFeedbackScreenState createState() => _RatingFeedbackScreenState();
}

class _RatingFeedbackScreenState extends State<RatingFeedbackScreen> {
  final _ratingController = TextEditingController();
  double _rating = 0; // Default rating value (0 to 5)
  String _feedback = ''; // User's feedback

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rate Your Ride')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Rate Your Ride', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Icon(Icons.star, color: Colors.yellow, size: 40),
            SizedBox(height: 10),
            // Rating Slider
            Slider(
              value: _rating,
              min: 0,
              max: 5,
              divisions: 5,
              label: '$_rating',
              onChanged: (double value) {
                setState(() {
                  _rating = value; // Update the rating value
                });
              },
            ),
            SizedBox(height: 10),
            Text('Rating: ${_rating.toStringAsFixed(1)}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            // Feedback TextField
            TextField(
              controller: _ratingController,
              decoration: InputDecoration(labelText: 'Write your feedback'),
              maxLines: 4,
              onChanged: (value) {
                _feedback = value; // Capture feedback from the user
              },
            ),
            SizedBox(height: 20),
            // Submit Feedback Button
            ElevatedButton(
              onPressed: () {
                if (_feedback.isNotEmpty) {
                  // Handle the feedback submission logic (save to a database, etc.)
                  print('Rating: $_rating');
                  print('Feedback: $_feedback');

                  // Show a success message and navigate back
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Feedback Submitted!')),
                  );

                  Navigator.pop(context); // Go back to the previous screen
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please provide feedback')),
                  );
                }
              },
              child: Text('Submit Feedback'),
            ),
          ],
        ),
      ),
    );
  }
}