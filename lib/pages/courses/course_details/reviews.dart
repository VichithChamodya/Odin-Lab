import 'package:flutter/material.dart';
import 'package:odinlab/constant/colors.dart';

class Reviews extends StatelessWidget {
  const Reviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Student Reviews",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 15),

          // rating summary
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                // average rating
                const Column(
                  children: [
                    Text(
                      "4.5",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "out of 5",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20),

                // star ratings breakdown
                Expanded(
                  child: Column(
                    children: [
                      _buildRatingBar(5, 80),
                      _buildRatingBar(4, 20),
                      _buildRatingBar(3, 10),
                      _buildRatingBar(2, 10),
                      _buildRatingBar(1, 5),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // review cards
          Expanded(
            child: ListView(
              children: const [
                _ReviewCard(
                  name: "Alex Johnson",
                  rating: 5,
                  review:
                      "This course was amazing! The content was clear, and I learned so much about design thinking.",
                  date: "Jan 25, 2025",
                ),
                _ReviewCard(
                  name: "Emily Carter",
                  rating: 4,
                  review:
                      "Very informative, but I wish there were more practical examples.",
                  date: "Jan 20, 2025",
                ),
                _ReviewCard(
                  name: "Mark Lee",
                  rating: 5,
                  review:
                      "Loved it! The lessons were engaging and easy to follow.",
                  date: "Jan 18, 2025",
                ),
                _ReviewCard(
                  name: "Mark Lee",
                  rating: 5,
                  review:
                      "Loved it! The lessons were engaging and easy to follow.",
                  date: "Jan 18, 2025",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // helper to build the rating bar
  Widget _buildRatingBar(int star, int percentage) {
    return Row(
      children: [
        Text(
          "$star★",
          style: const TextStyle(
            fontSize: 14,
            color: kGreyColor,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: LinearProgressIndicator(
            value: percentage / 100,
            backgroundColor: Colors.grey.shade300,
            color: kSubMainColor,
            minHeight: 8,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          "$percentage%",
          style: const TextStyle(
            fontSize: 14,
            color: kGreyColor,
          ),
        ),
      ],
    );
  }
}

// custom review card widget
class _ReviewCard extends StatelessWidget {
  final String name;
  final int rating;
  final String review;
  final String date;

  const _ReviewCard({
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
                color: kOrangeColor,
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
