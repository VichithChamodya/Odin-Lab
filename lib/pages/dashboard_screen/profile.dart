import 'package:flutter/material.dart';
import 'package:odinlab/constant/colors.dart';
import 'package:odinlab/widgets/profile_status_card.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // profile header section
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [kSubMainColor, kMainColor, kBlackColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: [
                  // profile picture
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundColor: kGreyColor,
                        child: Icon(
                          Icons.person,
                          size: 80,
                          color: kWhiteColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.camera_alt, color: kWhiteColor),
                        color: kSubMainColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // full name & user name
                  const Text(
                    "Vichith Wickramarathna",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: kWhiteColor,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "@vichithchamodya",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProfileStatusCard(
                  statusIcon: Icons.school,
                  statusValue: "25",
                  statusTitle: "Courses Enrolled",
                ),
                ProfileStatusCard(
                  statusIcon: Icons.access_time,
                  statusValue: "120",
                  statusTitle: "Hours Learned",
                ),
                ProfileStatusCard(
                  statusIcon: Icons.star,
                  statusValue: "8",
                  statusTitle: "Achievements",
                ),
              ],
            ),

            const SizedBox(height: 30),

            // settings & actions section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Account Settings",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 15),
                  _buildSettingsTile(
                    context,
                    title: "Edit Profile",
                    icon: Icons.edit,
                    onTap: () {},
                  ),
                  _buildSettingsTile(
                    context,
                    title: "Privacy Settings",
                    icon: Icons.lock,
                    onTap: () {},
                  ),
                  _buildSettingsTile(
                    context,
                    title: "Notifications",
                    icon: Icons.notifications,
                    onTap: () {},
                  ),
                  _buildSettingsTile(
                    context,
                    title: "Payment Methods",
                    icon: Icons.payment,
                    onTap: () {},
                  ),
                  _buildSettingsTile(
                    context,
                    title: "Logout",
                    icon: Icons.logout,
                    iconColor: Colors.red,
                    onTap: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // motivational section
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: kSubMainColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  const Text(
                    "“Learning never exhausts the mind.”",
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: kWhiteColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kWhiteColor,
                      foregroundColor: kSubMainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("Continue Learning"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // settings Tile
  Widget _buildSettingsTile(
    BuildContext context, {
    required String title,
    required IconData icon,
    Color iconColor = kSubMainColor,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
      ),
      onTap: onTap,
    );
  }
}
