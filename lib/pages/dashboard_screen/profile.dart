import 'package:flutter/material.dart';
import 'package:odinlab/constant/colors.dart';
import 'package:odinlab/widgets/profile_status_card.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Profile header with shrinking effect
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Profile picture
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

                  // Full name & username
                  const Text(
                    "Vichith Wickramarathna",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: kBlackColor,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "@vichithchamodya",
                    style: TextStyle(
                      fontSize: 14,
                      color: kGreyColor,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Scrollable content starts here
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: kWhiteColor,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // hanger
                    Container(
                      height: 6,
                      width: 60,
                      margin: const EdgeInsets.only(top: 8, bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade300,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Profile status cards
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ProfileStatusCard(
                          statusIcon: Icons.school,
                          statusValue: "25",
                          statusTitle: "Enrolled",
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

                    // Settings & actions section
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
                              color: kGreyColor,
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
                            iconColor: kGreyColor,
                            onTap: () {},
                          ),
                          _buildSettingsTile(
                            context,
                            title: "Notifications",
                            icon: Icons.notifications,
                            iconColor: kOrangeColor,
                            onTap: () {},
                          ),
                          _buildSettingsTile(
                            context,
                            title: "Payment Methods",
                            icon: Icons.payment,
                            iconColor: kGreenColor,
                            onTap: () {},
                          ),
                          _buildSettingsTile(
                            context,
                            title: "Logout",
                            icon: Icons.logout,
                            iconColor: kRedColor,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Motivational section
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
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Settings Tile
  Widget _buildSettingsTile(
    BuildContext context, {
    required String title,
    required IconData icon,
    Color iconColor = kSubMainColor,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      minVerticalPadding: 0,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: kGreyColor,
      ),
      onTap: onTap,
    );
  }
}
