import 'package:flutter/material.dart';
import 'package:odinlab/constant/colors.dart';

class OngoingCourseCard extends StatefulWidget {
  const OngoingCourseCard({super.key});

  @override
  State<OngoingCourseCard> createState() => _OngoingCourseCardState();
}

class _OngoingCourseCardState extends State<OngoingCourseCard> {
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
              color: Theme.of(context).appBarTheme.backgroundColor,
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Python for beinners",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Text(
                        "4 lessons to go",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: kGreyColor,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: LinearProgressIndicator(
                              value: 0.6,
                              backgroundColor: Colors.grey.shade300,
                              color: kSubMainColor,
                              minHeight: 5,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "60%",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: kGreyColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/*
Container(
          margin: const EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).appBarTheme.backgroundColor,
            boxShadow: const [
              BoxShadow(
                color: Color(0x20000000),
                blurRadius: 5,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                "assets/images/Anime girl headphones desktop computer screen.jpg",
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            title: const Text(
              "Python for beinners",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "4 lessons to go",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: kGreyColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        value: 0.6,
                        backgroundColor: Colors.grey.shade300,
                        color: kSubMainColor,
                        minHeight: 5,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "60%",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: kGreyColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            onTap: () {},
          ),
        ),
*/
