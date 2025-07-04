import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapido/provider/auth_provider.dart';
import 'ride_history_screen.dart';
import 'profile_screen.dart';
import 'notifications_screen.dart';
import 'settings_screen.dart';
import 'help_support_screen.dart';
import 'ride_booking_screen.dart';

class HomeScreen extends StatelessWidget {
  final bool isRider;

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
              // Calling the signOut method from AuthProvider
              Provider.of<AuthProvider>(context, listen: false).signOut();
              Navigator.pushReplacementNamed(context, '/login'); 
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            _buildNavigationButton(
              context,
              "Book a Ride",
              RideBookingScreen(),
            ),
            _buildNavigationButton(
              context,
              "View Ride History",
              RideHistoryScreen(isRider: isRider),
            ),
            _buildNavigationButton(
              context,
              "View Profile",
              ProfileScreen(isRider: isRider),
            ),
            _buildNavigationButton(
              context,
              "View Notifications",
              NotificationsScreen(),
            ),
            _buildNavigationButton(
              context,
              "Settings",
              SettingsScreen(),
            ),
            _buildNavigationButton(
              context,
              "Help & Support",
              HelpSupportScreen(),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Calling the signOut method from AuthProvider
                Provider.of<AuthProvider>(context, listen: false).signOut();
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }

  // A helper function to build navigation buttons
  Widget _buildNavigationButton(BuildContext context, String text, Widget screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        child: Text(text),
      ),
    );
  }
}
