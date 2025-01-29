import 'package:flutter/material.dart';
import 'package:odinlab/widgets/ongoing_course_card.dart';

class Ongoing extends StatefulWidget {
  const Ongoing({super.key});

  @override
  State<Ongoing> createState() => _OngoingState();
}

class _OngoingState extends State<Ongoing> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: OngoingCourseCard(),
    );
  }
}
