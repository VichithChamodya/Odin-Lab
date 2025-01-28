import 'package:flutter/material.dart';
import 'package:odinlab/widgets/completed_course_card.dart';

class Completed extends StatefulWidget {
  const Completed({super.key});

  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  @override
  Widget build(BuildContext context) {
    return const CompletedCourseCard();
  }
}
