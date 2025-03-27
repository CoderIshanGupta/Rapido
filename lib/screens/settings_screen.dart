import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Language'),
              onTap: () {
                // Open language selection screen
              },
            ),
            ListTile(
              title: Text('Notification Preferences'),
              onTap: () {
                // Open notification preferences
              },
            ),
            ListTile(
              title: Text('Privacy Settings'),
              onTap: () {
                // Open privacy settings
              },
            ),
            ListTile(
              title: Text('Help and Support'),
              onTap: () {
                // Navigate to Help and Support screen
              },
            ),
          ],
        ),
      ),
    );
  }
}
