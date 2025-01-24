import 'package:flutter/material.dart';
import 'package:odinlab/constant/colors.dart';
import 'package:odinlab/pages/dashboard_screen/bookmarks.dart';
import 'package:odinlab/pages/dashboard_screen/explore.dart';
import 'package:odinlab/pages/dashboard_screen/my_courses.dart';
import 'package:odinlab/pages/dashboard_screen/profile.dart';
import 'package:odinlab/widgets/bitzy.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  double rotationAngle = 0; // rotation angle for the Z-axis
  bool isDrawerOpen = false;

  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Explore(),
    const Bookmarks(),
    const MyCourses(),
    const Profile(),
  ];

  void toggleDrawer() {
    setState(() {
      if (isDrawerOpen) {
        xOffset = 0;
        yOffset = 0;
        scaleFactor = 1;
        rotationAngle = 0;
        isDrawerOpen = false;
      } else {
        // open drawer with rotation
        xOffset = MediaQuery.of(context).size.width * 0.5;
        yOffset = MediaQuery.of(context).size.height * 0.15;
        // slight rotation in radians (approx. -2.8 degrees)
        rotationAngle = 0.08;
        scaleFactor = 0.80;
        isDrawerOpen = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateZ(rotationAngle), // apply rotation
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            isDrawerOpen ? BorderRadius.circular(30) : BorderRadius.zero,
        boxShadow: isDrawerOpen
            ? [
                const BoxShadow(
                  color: kShadowColor,
                  blurRadius: 15,
                  spreadRadius: 2,
                  offset: Offset(0, 8),
                ),
              ]
            : [],
      ),
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.blueAccent,
          title: const Text("Odin Lab"),
          leading: IconButton(
            onPressed: toggleDrawer,
            icon: Icon(
              isDrawerOpen ? Icons.arrow_back_ios : Icons.menu,
              color: kBlackColor,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
            Builder(
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    child: Image.asset(
                      "assets/gifs/onboarding_3.gif",
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                    onTap: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  ),
                );
              },
            ),
          ],
        ),
        endDrawer: Drawer(
          width: MediaQuery.of(context).size.width * 1,
          child: const Bitzy(),
        ),
        body: Stack(
          children: [
            _pages[_currentIndex],
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: "Explore",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmarks),
              label: "Bookmarks",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "My Courses",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(
              () {
                _currentIndex = index;
              },
            );
          },
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}
