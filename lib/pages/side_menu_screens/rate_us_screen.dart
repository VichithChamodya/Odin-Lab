import 'package:flutter/material.dart';
import 'package:odinlab/widgets/animatedButton.dart';

class RateUs extends StatelessWidget {
  const RateUs({super.key});

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Terms & Conditions"),
          content: const Text(
            "Do you accept the terms and conditions?",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Decline"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // Add acceptance logic here
              },
              child: const Text("Accept"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AlertDialog Example")),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () => _showDialog(context),
              child: const Text("Show Dialog"),
            ),
          ),
          AnimatedButton(
            text: "Tap Me",
            onPressed: () {
              // Handle button press
              debugPrint("Button Pressed!");
            },
            tapColor: Colors.blue.withOpacity(0.3), // Color when pressed
            normalColor: Colors.transparent, // Normal background color
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
        ],
      ),
    );
  }
}
