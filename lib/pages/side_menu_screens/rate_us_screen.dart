import 'package:flutter/material.dart';

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
                Navigator.of(context).pop(); // close the dialog
              },
              child: const Text("Decline"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // close the dialog
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
        ],
      ),
    );
  }
}
