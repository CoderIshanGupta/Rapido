import 'package:flutter/material.dart';
import 'ride_history_screen.dart';
import 'profile_screen.dart';
import 'notifications_screen.dart';
import 'settings_screen.dart';
import 'help_support_screen.dart';
import 'ride_booking_screen.dart'; // Assuming the booking screen is already implemented

class HomeScreen extends StatelessWidget {
  final bool isRider; // Flag to determine whether it's a Rider or Driver

  HomeScreen({this.isRider = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isRider ? 'Rider Dashboard' : 'Driver Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              // Logic for Sign Out / Log Out (not implemented yet)
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            // Ride Booking Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RideBookingScreen(),
                  ),
                );
              },
              child: Text('Book a Ride'),
            ),
            SizedBox(height: 16),

            // Ride History Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RideHistoryScreen(isRider: isRider),
                  ),
                );
              },
              child: Text('View Ride History'),
            ),
            SizedBox(height: 16),

            // Profile Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(isRider: isRider),
                  ),
                );
              },
              child: Text('View Profile'),
            ),
            SizedBox(height: 16),

            // Notifications Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationsScreen(),
                  ),
                );
              },
              child: Text('View Notifications'),
            ),
            SizedBox(height: 16),

            // Settings Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsScreen(),
                  ),
                );
              },
              child: Text('Settings'),
            ),
            SizedBox(height: 16),

            // Help & Support Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HelpSupportScreen(),
                  ),
                );
              },
              child: Text('Help & Support'),
            ),
            SizedBox(height: 16),

            // Logout Button
            ElevatedButton(
              onPressed: () {
                // Add logout functionality here when you're ready
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
