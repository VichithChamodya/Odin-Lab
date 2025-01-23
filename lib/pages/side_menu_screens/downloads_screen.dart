import 'package:flutter/material.dart';

class Downloads extends StatelessWidget {
  const Downloads({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Downloads"),
      ),
      body: const Column(
        children: [Text("Downloads")],
      ),
    );
  }
}
