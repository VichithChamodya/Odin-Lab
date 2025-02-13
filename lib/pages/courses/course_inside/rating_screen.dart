import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:odinlab/constant/colors.dart';
import 'package:odinlab/widgets/custom_button.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  int _selectedRating = 0;
  final int _maxFeedbackLength = 200;
  final TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Rate Your Experience",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                "assets/lotties/rate_yellow.json",
                height: 150,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              const Text(
                "How was your experience?",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                "We'd love to hear your feedback. Please rate your experience below",
                style: TextStyle(fontSize: 16, color: kGreyColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => IconButton(
                    onPressed: () {
                      setState(() {
                        _selectedRating = index + 1;
                      });
                    },
                    icon: Icon(
                      Icons.star,
                      color: index < _selectedRating
                          ? kRatingColor
                          : Colors.grey.shade300,
                      size: 40,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (_selectedRating > 0) ...[
                Text(
                  "You selected $_selectedRating star(s)",
                  style: const TextStyle(
                    fontSize: 16,
                    color: kOrangeColor,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _feedbackController,
                  maxLines: 5,
                  maxLength: _maxFeedbackLength,
                  decoration: InputDecoration(
                    hintText: "Write your feedback...",
                    hintStyle: const TextStyle(color: kGreyColor),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: kGreyColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: kSubMainColor),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    counterText:
                        "${_feedbackController.text.length}/$_maxFeedbackLength",
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                const SizedBox(height: 30),
                CustomButton(
                  buttonText: "Submit Feedback",
                  buttonColor1: Colors.green,
                  buttonColor2: kGreenColor,
                  onPressed: () {
                    //dfinal feedback = _feedbackController.text.trim();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: kSubMainColor,
                        showCloseIcon: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        content: Text(
                          "Thank you for your feedback! 🥰",
                          style: TextStyle(color: kWhiteColor),
                        ),
                      ),
                    );
                    // close page after 2 seconds
                    Future.delayed(
                      const Duration(seconds: 2),
                      () {
                        WidgetsBinding.instance.addPostFrameCallback(
                          (_) {
                            if (mounted) {
                              Navigator.pop(context);
                            }
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
