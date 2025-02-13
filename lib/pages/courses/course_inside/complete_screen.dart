import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:odinlab/constant/colors.dart';
import 'package:odinlab/pages/courses/course_inside/rating_screen.dart';
import 'package:odinlab/pages/main_screen.dart';
import 'package:odinlab/widgets/custom_button.dart';

class CompleteScreen extends StatelessWidget {
  const CompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              "assets/lotties/completed.json",
              height: 400,
              width: 400,
              fit: BoxFit.cover,
            ),
            const Text(
              "Congradulations ! 🥳",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "You have completed the course",
              style: TextStyle(
                fontSize: 16,
                color: kGreyColor,
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              buttonText: "Explore More",
              buttonColor1: Colors.green,
              buttonColor2: kGreenColor,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    title: const Text(
                      "Rate Your Experience! 😊",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    content: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "We hope you enjoyed the course. Would you like to leave feedback or explore more courses?",
                          ),
                          const SizedBox(height: 10),
                          Lottie.asset(
                            "assets/lotties/rate_blue.json",
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainScreen(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: kRedColor,
                        ),
                        child: const Text("Leave"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RatingPage(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: kOrangeColor,
                        ),
                        child: const Text("Give Feedback"),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              buttonText: "Boost Your Knowledge",
              buttonColor1: Colors.blue,
              buttonColor2: Colors.lightBlueAccent,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    title: const Text(
                      "Boost Your Knowledge! 🚀",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    content: const Text(
                      "Prepare for exams or dive deeper by exploring our collection of model papers and sample tests. Ready to take on the challenge?",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: kRedColor,
                        ),
                        child: const Text("Not Now"),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: kOrangeColor,
                        ),
                        child: const Text("Explore"),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RatingPage(),
                  ),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: kOrangeColor,
              ),
              child: const Text(
                "Give Feedback",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
