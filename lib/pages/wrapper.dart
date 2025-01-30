import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:odinlab/models/user_model.dart';
import 'package:odinlab/pages/authentication/authenticate.dart';
import 'package:odinlab/pages/main_screen.dart';
import 'package:odinlab/widgets/side_menu.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    //user data that the provider provides this can be a user data or can be null
    final user = Provider.of<UserModel?>(context);
    print("user: $user");

    if (user == null) {
      return const Authenticate();
    } else {
      return Stack(
        children: [
          SideMenu(),
          const MainScreen(),
        ],
      );
    }
  }
}
