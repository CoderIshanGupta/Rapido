import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RideBookingScreen extends StatefulWidget {
  @override
  _RideBookingScreenState createState() => _RideBookingScreenState();
}

class _RideBookingScreenState extends State<RideBookingScreen> {
  late GoogleMapController _controller;
  LatLng _pickUp = LatLng(12.9716, 77.5946); // Default coordinates (Bangalore)
  LatLng _dropOff = LatLng(12.9352, 77.6246);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book a Ride')),
      body: Column(
        children: <Widget>[
          Container(
            height: 400,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(target: _pickUp, zoom: 12),
              markers: {
                Marker(markerId: MarkerId('pickup'), position: _pickUp),
                Marker(markerId: MarkerId('dropoff'), position: _dropOff),
              },
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Simulate Ride Booking
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Ride Booked!'),
                  content: Text('Your ride has been booked.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            },
            child: Text('Confirm Ride'),
          ),
        ],
      ),
    );
  }
}
