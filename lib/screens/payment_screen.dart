import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedPaymentMethod = "Cash"; // Default payment method

  final List<String> paymentMethods = ["Cash", "Card", "UPI"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Total Fare: ₹250", style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedPaymentMethod,
              onChanged: (String? newValue) {
                setState(() {
                  selectedPaymentMethod = newValue!;
                });
              },
              items: paymentMethods.map((String method) {
                return DropdownMenuItem<String>(
                  value: method,
                  child: Text(method),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: "Select Payment Method",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Handle payment logic here
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Payment completed with $selectedPaymentMethod."),
                ));
              },
              child: Text("Pay Now"),
            ),
          ],
        ),
      ),
    );
  }
}
