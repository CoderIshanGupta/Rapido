import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 5, // Hardcoded for now, will be dynamic
          itemBuilder: (context, index) {
            return NotificationCard();
          },
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(Icons.notifications),
        title: Text('Ride Request Alert'),
        subtitle: Text('A new ride request has been made for you.'),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Navigate to more details if needed
        },
      ),
    );
  }
}
