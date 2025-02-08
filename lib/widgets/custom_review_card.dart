import 'package:flutter/material.dart';
import 'package:odinlab/constant/colors.dart';

class CustomReviewCard extends StatelessWidget {
  final String name;
  final int rating;
  final String review;
  final String date;

  const CustomReviewCard({
    super.key,
    required this.name,
    required this.rating,
    required this.review,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: kLisgtShadowColor,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // reviewer info
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blue.shade100,
                child: Text(
                  name[0], // get first letter of the name
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kSubMainColor,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 12,
                      color: kGreyColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5),
          // star rating
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: kRatingColor,
                size: 20,
              ),
            ),
          ),
          const SizedBox(height: 5),
          // review text
          Text(
            review,
            style: const TextStyle(
              fontSize: 12,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
