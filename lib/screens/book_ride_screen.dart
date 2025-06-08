import 'package:flutter/material.dart';

class BookRideScreen extends StatefulWidget {
  @override
  _BookRideScreenState createState() => _BookRideScreenState();
}

class _BookRideScreenState extends State<BookRideScreen> {
  String selectedRideType = "Bike";  // Default ride type
  TextEditingController pickupController = TextEditingController();
  TextEditingController dropController = TextEditingController();

  // Dummy ride types, can be dynamic based on the backend
  final List<String> rideTypes = ["Bike", "Auto", "Car"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Ride"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: pickupController,
              decoration: InputDecoration(
                labelText: "Pickup Location",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: dropController,
              decoration: InputDecoration(
                labelText: "Drop Location",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedRideType,
              onChanged: (String? newValue) {
                setState(() {
                  selectedRideType = newValue!;
                });
              },
              items: rideTypes.map((String rideType) {
                return DropdownMenuItem<String>(
                  value: rideType,
                  child: Text(rideType),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: "Select Ride Type",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Handle booking logic here
                // For now, just showing a simple confirmation
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Ride booked from ${pickupController.text} to ${dropController.text} with $selectedRideType."),
                ));
              },
              child: Text("Book Ride"),
            ),
          ],
        ),
      ),
    );
  }
}
