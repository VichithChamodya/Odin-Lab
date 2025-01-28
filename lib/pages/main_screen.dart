import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:odinlab/constant/colors.dart';
import 'package:odinlab/widgets/bitzy.dart';

// dashboard screens
import 'package:odinlab/pages/dashboard_screen/bookmarks.dart';
import 'package:odinlab/pages/dashboard_screen/explore.dart';
import 'package:odinlab/pages/dashboard_screen/my_courses.dart';
import 'package:odinlab/pages/dashboard_screen/profile.dart';

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

  // date and time formatter
  final DateFormat formatter = DateFormat("EEEE, MMMM, dd");

  // function to determine greeting message based on time
  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return "Good Morning..!";
    } else if (hour < 18) {
      return "Good Afternoon..!";
    } else {
      return "Good Evening..!";
    }
  }

  int _currentIndex = 0;
  final PageController _pageController = PageController();

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
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String greeting = getGreeting();

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
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hello Vichith,",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: kGreyColor,
                ),
              ),
              Text(
                greeting,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: kBlackColor,
                ),
              ),
            ],
          ),
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
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: MySearchDelegate(),
                );
              },
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
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: const [
            Explore(),
            Bookmarks(),
            MyCourses(),
            Profile(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: kSubMainColor,
          unselectedItemColor: kGreyColor,
          onTap: (index) {
            _pageController.animateToPage(
              index,
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 300),
            );
            setState(
              () {
                _currentIndex = index;
              },
            );
          },
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
        ),
      ),
    );
  }
}

// search bar delegate
class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = [
      "Python",
      "Dart",
      "Flutter",
      "Java",
      "Kotlin",
      "Swift",
      "React Native",
      "React JS",
      "Node JS",
    ];
    suggestions = suggestions
        .where(
          (element) => element.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index];
          },
        );
      },
    );
  }
}
