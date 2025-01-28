import 'package:flutter/material.dart';
import 'package:odinlab/constant/colors.dart';

class CompletedCourseCard extends StatelessWidget {
  const CompletedCourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: kWhiteColor,
              boxShadow: const [
                BoxShadow(
                  color: Color(0x20000000),
                  blurRadius: 5,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "assets/images/Anime girl headphones desktop computer screen.jpg",
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Python for beinners",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: kBlackColor,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.check_circle, size: 20, color: kGreenColor),
                        SizedBox(width: 5),
                        Text(
                          "Completed",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: kGreenColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
