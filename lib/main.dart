import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'package:odinlab/providers/theme_provider.dart';
import 'package:odinlab/widgets/side_menu.dart';
import 'package:odinlab/pages/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const OdinLab(),
    ),
  );
}

class OdinLab extends StatelessWidget {
  const OdinLab({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Odin Lab",
      theme: Provider.of<ThemeProvider>(context).getThemeData,
      home: const Scaffold(
        body: Stack(
          children: [
            SideMenu(),
            MainScreen(),
          ],
        ),
      ),
    );
  }
}
