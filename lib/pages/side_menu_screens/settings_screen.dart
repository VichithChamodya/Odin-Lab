import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:odinlab/provider/provider.dart';

import 'package:odinlab/constant/colors.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body:
          Consumer<UiProvider>(builder: (context, UiProvider notifier, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Appearance",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: kGreyColor,
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.dark_mode),
                  title: const Text(
                    "Dark theme",
                    style: TextStyle(fontSize: 14),
                  ),
                  trailing: Switch(
                    activeColor: kMainColor,
                    value: notifier.isDark,
                    onChanged: (value) => notifier.changeTheme(),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Divider(),
                ),
                const Text(
                  "notifications",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: kGreyColor,
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.notifications_active_outlined),
                  title: const Text(
                    "Discouts notifications",
                    style: TextStyle(fontSize: 14),
                  ),
                  trailing: Switch(
                    activeColor: kMainColor,
                    value: true,
                    onChanged: (value) {},
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.notifications_active_outlined),
                  title: const Text(
                    "New course notifications",
                    style: TextStyle(fontSize: 14),
                  ),
                  trailing: Switch(
                    activeColor: kMainColor,
                    value: true,
                    onChanged: (value) {},
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.notifications_active_outlined),
                  title: const Text(
                    "Reminder notifications",
                    style: TextStyle(fontSize: 14),
                  ),
                  trailing: Switch(
                    activeColor: kMainColor,
                    value: true,
                    onChanged: (value) {},
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.notifications_active_outlined),
                  title: const Text(
                    "App update notifications",
                    style: TextStyle(fontSize: 14),
                  ),
                  trailing: Switch(
                    activeColor: kMainColor,
                    value: true,
                    onChanged: (value) {},
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Divider(),
                ),
                const Text(
                  "Support",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: kGreyColor,
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.help_outline),
                  title: const Text(
                    "Help & Support",
                    style: TextStyle(fontSize: 14),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.report_gmailerrorred),
                  title: const Text(
                    "Report an issue",
                    style: TextStyle(fontSize: 14),
                  ),
                  onTap: () {},
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Divider(),
                ),
                const Text(
                  "Legal",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: kGreyColor,
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.privacy_tip_outlined),
                  title: const Text(
                    "Privacy policy",
                    style: TextStyle(fontSize: 14),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.privacy_tip_outlined),
                  title: const Text(
                    "Terms of service",
                    style: TextStyle(fontSize: 14),
                  ),
                  onTap: () {},
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Divider(),
                ),
                const Text(
                  "Delete account",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: kGreyColor,
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.delete_outline,
                    color: kRedColor,
                  ),
                  title: const Text(
                    "Delete account",
                    style: TextStyle(fontSize: 14, color: kRedColor),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
