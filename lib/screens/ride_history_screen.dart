import 'package:flutter/material.dart';

class RideHistoryScreen extends StatelessWidget {
  final bool isRider; // Flag to determine whether it's a Rider or Driver

  RideHistoryScreen({this.isRider = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isRider ? 'Your Ride History' : 'Driver Ride History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 10, // For now, hardcoded to 10 (can be dynamic later)
          itemBuilder: (context, index) {
            return RideHistoryCard();
          },
        ),
      ),
    );
  }
}

class RideHistoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(Icons.directions_car),
        title: Text('Ride from A to B'),
        subtitle: Text('Completed on 12/10/2023'),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Navigate to ride details screen (if needed)
        },
      ),
    );
  }
}