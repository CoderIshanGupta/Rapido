import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  final List<Map<String, String>> faqs = [
    {
      'question': 'How do I book a ride?',
      'answer': 'Open the app, select your ride, and confirm your pickup location.',
    },
    {
      'question': 'How do I pay for a ride?',
      'answer': 'You can pay via cash or card, whichever is preferred.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAQs"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: ListView.builder(
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          return Card(
            child: ExpansionTile(
              title: Text(faqs[index]['question']!),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(faqs[index]['answer']!),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
