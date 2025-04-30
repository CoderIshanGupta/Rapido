// user_profile_screen.dart
import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text('Name'),
              subtitle: Text('John Doe'),
            ),
            ListTile(
              title: Text('Email'),
              subtitle: Text('john.doe@example.com'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle logout or profile update
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
