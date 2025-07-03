import 'package:flutter/material.dart';

class HelpSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Support'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('FAQ'),
              onTap: () {
                // Navigate to FAQ page
              },
            ),
            ListTile(
              title: Text('Contact Support'),
              onTap: () {
                // Navigate to contact support page
              },
            ),
            ListTile(
              title: Text('About Us'),
              onTap: () {
                // Navigate to about us page
              },
            ),
          ],
        ),
      ),
    );
  }
}