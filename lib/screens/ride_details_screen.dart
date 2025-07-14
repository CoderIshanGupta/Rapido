import 'package:flutter/material.dart';

class RideDetailsScreen extends StatelessWidget {
  final String pickupLocation;
  final String dropLocation;
  final String rideType;
  final String rideStatus;

  RideDetailsScreen({
    required this.pickupLocation,
    required this.dropLocation,
    required this.rideType,
    required this.rideStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ride Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Pickup Location: $pickupLocation", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text("Drop Location: $dropLocation", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text("Ride Type: $rideType", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text("Status: $rideStatus", style: TextStyle(fontSize: 16)),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Handle cancelling ride or any other logic
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Ride $rideStatus."),
                ));
              },
              child: Text("Cancel Ride"),
            ),
          ],
        ),
      ),
    );
  }
}
