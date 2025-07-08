import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        centerTitle: true,
      ),
      body: PageView(
        children: [
          _buildOnboardingPage(
            context,
            "Welcome to our App",
            "The best ride-hailing experience with ease of use.",
            Icons.directions_car,
          ),
          _buildOnboardingPage(
            context,
            "Easy Booking",
            "Book a ride in just a few taps!",
            Icons.book,
          ),
          _buildOnboardingPage(
            context,
            "Quick Payment",
            "Secure and fast payments through the app.",
            Icons.payment,
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardingPage(BuildContext context, String title, String description, IconData icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 100, color: Colors.blue),
        SizedBox(height: 20),
        Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text(description, textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Navigate to the next screen (e.g., login or home)
            Navigator.pushReplacementNamed(context, '/login');
          },
          child: Text("Get Started"),
        ),
      ],
    );
  }
}
