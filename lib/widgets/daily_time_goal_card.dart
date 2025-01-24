import 'package:flutter/material.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:odinlab/constant/colors.dart';

class DailyTimeGoalCard extends StatefulWidget {
  final double progressValue;
  final int timeGoal;

  const DailyTimeGoalCard(
      {super.key, required this.progressValue, required this.timeGoal});

  @override
  State<DailyTimeGoalCard> createState() => _DailyTimeGoalCardState();
}

class _DailyTimeGoalCardState extends State<DailyTimeGoalCard> {
  @override
  Widget build(BuildContext context) {
    // determine color based on progress
    List<Color> getProgressColor() {
      if (widget.progressValue >= 0.75) {
        return [kGreenColor, const Color(0xFF33FF33)];
      }
      if (widget.progressValue >= 0.5) {
        return [const Color(0xFFFF9933), const Color(0xFFFFE733)];
      }
      return [kWhiteColor, kWhiteColor];
    }

    // calculate completed time
    int done = (widget.progressValue * widget.timeGoal).toInt();

    // calculate percentage
    int percentage = (done / widget.timeGoal * 100).toInt();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          colors: [kSubMainColor, kMainColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: const [
          BoxShadow(
            color: kShadowColor,
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Today's Learning Goal",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: kWhiteColor,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${done}m left of ${widget.timeGoal} mins",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: kWhiteColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.progressValue >= 1.0
                          ? "Well done ! You've hit today's goal..."
                          : "Keep going ! You're doing great...",
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: kWhiteColor,
                          fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                          height: 30,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              foregroundColor: kWhiteColor,
                              side: const BorderSide(
                                width: 1,
                                color: kWhiteColor,
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Adjust Goal",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          height: 30,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              backgroundColor: kWhiteColor,
                              foregroundColor: kSubMainColor,
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Start Learning",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularPercentIndicator(
                      radius: 50,
                      lineWidth: 12,
                      percent: widget.progressValue.clamp(0.0, 1.0),
                      //progressColor: getProgressColor(),
                      linearGradient: LinearGradient(
                        colors: getProgressColor(),
                      ),
                      backgroundColor: kProgressBarBackground,
                      circularStrokeCap: CircularStrokeCap.round,
                      animation: true,
                      animationDuration: 2000,
                    ),
                    Text(
                      "$percentage %",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: kWhiteColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // LinearProgressIndicator(
            //   value: widget.progressValue,
            //   minHeight: 12,
            //   borderRadius: BorderRadius.circular(15),
            //   backgroundColor: kShadowColor,
            //   valueColor: AlwaysStoppedAnimation(getProgressColor()),
            // ),
          ],
        ),
      ),
    );
  }
}
