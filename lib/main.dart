import 'package:flutter/material.dart';
import 'package:odinlab/constant/colors.dart';
import 'package:odinlab/provider/provider.dart';
import 'package:odinlab/widgets/side_menu.dart';
import 'package:odinlab/pages/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(const OdinLab());
}

class OdinLab extends StatelessWidget {
  const OdinLab({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => UiProvider()..init(),
      child:
          Consumer<UiProvider>(builder: (context, UiProvider notifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Odin Lab",
          themeMode: notifier.isDark ? ThemeMode.dark : ThemeMode.light,
          darkTheme: notifier.isDark ? notifier.darkTheme : notifier.lightTheme,
          theme: ThemeData(
            fontFamily: "Inter",
            primaryColor: kMainColor,
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: kSubMainColor,
              selectionColor: kSelectionColor,
              selectionHandleColor: kSubMainColor,
            ),
          ),
          home: const Scaffold(
            body: Stack(
              children: [
                SideMenu(),
                MainScreen(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
