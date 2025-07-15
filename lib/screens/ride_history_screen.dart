import 'package:flutter/material.dart';

class RideHistoryScreen extends StatelessWidget {
  final bool isRider;

  RideHistoryScreen({required this.isRider});

  // Simulated list of past rides
  final List<Map<String, String>> rideHistory = [
    {"destination": "City Center", "date": "2024-03-25"},
    {"destination": "Airport", "date": "2024-03-20"},
    {"destination": "Train Station", "date": "2024-03-15"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isRider ? 'Rider Ride History' : 'Driver Ride History')),
      body: rideHistory.isEmpty
          ? Center(child: Text('No rides yet.'))
          : ListView.builder(
              itemCount: rideHistory.length,
              itemBuilder: (context, index) {
                final ride = rideHistory[index];
                return ListTile(
                  title: Text('Ride to ${ride["destination"]}'),
                  subtitle: Text('Date: ${ride["date"]}'),
                );
              },
            ),
    );
  }
}