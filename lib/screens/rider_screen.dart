import 'package:flutter/material.dart';

class RiderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rider Dashboard')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/rideBooking');
          },
          child: Text('Book a Ride'),
        ),
      ),
    );
  }
}
