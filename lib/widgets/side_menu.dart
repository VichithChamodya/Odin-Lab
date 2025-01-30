import 'package:flutter/material.dart';

import 'package:odinlab/constant/colors.dart';
import 'package:odinlab/pages/side_menu_screens/downloads_screen.dart';
import 'package:odinlab/pages/side_menu_screens/rate_us_screen.dart';
import 'package:odinlab/pages/side_menu_screens/settings_screen.dart';
import 'package:odinlab/services/auth.dart';
import 'package:odinlab/widgets/custom_button.dart';

class SideMenu extends StatelessWidget {
  SideMenu({super.key});

  // create a object from auth service
  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [kSubMainColor, kBlackColor],
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildHeader(),
            _buildMenuItems(context),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: kShadowColor,
          ),
          child: Image.asset(
            "assets/images/logo.png",
            width: 40,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          "Odin Lab",
          style: TextStyle(
            fontFamily: "Orbitron",
            color: kWhiteColor,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItems(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        "icon": Icons.settings_outlined,
        "text": "Settings",
        "page": const Settings(),
      },
      {
        "icon": Icons.download_done,
        "text": "Downloads",
        "page": const Downloads(),
      },
      {
        "icon": Icons.chat_bubble_outline,
        "text": "Messages",
        "page": const Settings(),
      },
      {
        "icon": Icons.bookmark_border,
        "text": "Wishlist",
        "page": const Settings(),
      },
      {
        "icon": Icons.favorite_border,
        "text": "My Courses",
        "page": const Settings(),
      },
      {
        "icon": Icons.lightbulb_outline,
        "text": "Hint",
        "page": const Settings(),
      },
      {
        "icon": Icons.star_border,
        "text": "Rate Us",
        "page": const RateUs(),
      },
    ];

    return Column(
      children: menuItems.map(
        (item) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: _buildMenuItem(
              icon: item["icon"],
              text: item["text"],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => item["page"]),
                );
              },
            ),
          );
        },
      ).toList(),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      splashColor: const Color(0xFF448AFF),
      highlightColor: Colors.transparent,
      child: Row(
        children: [
          Icon(icon, color: kWhiteColor),
          const SizedBox(width: 20),
          Text(
            text,
            style: const TextStyle(color: kWhiteColor),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDialog(context),
      child: const Row(
        children: [
          Icon(Icons.logout, color: kGreyColor),
          SizedBox(width: 10),
          Text(
            "Log out",
            style: TextStyle(color: kRedColor),
          ),
        ],
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: const Color(0xC5000000),
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "Bye! ",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: kGreyColor,
                  ),
                ),
                TextSpan(
                  text: "Vichith 👋🏻\n",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: kGreyColor,
                  ),
                ),
                TextSpan(
                  text: "We wish to see you back real soon...",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: kGreyColor,
                  ),
                ),
              ],
            ),
          ),
          content: const Text(
            "Are you sure you want to logout ?",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: kRedColor,
            ),
          ),
          actions: [
            CustomButton(
              buttonText: "CANCEL",
              buttonColor1: kSubMainColor,
              buttonColor2: kMainColor,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CustomButton(
              buttonText: "LOGOUT",
              buttonColor1: kRedColor,
              buttonColor2: kDarkRedColor,
              onPressed: () async {
                await _auth.signOut();
                // close the dialog if widget is still mounted
                if (context.mounted) {
                  Navigator.pop(context);
                }
              },
            ),
          ],
        );
      },
    );
  }
}
