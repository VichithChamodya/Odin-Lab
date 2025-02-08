import 'package:flutter/material.dart';
import 'package:odinlab/constant/colors.dart';
import 'package:odinlab/models/review_model.dart';
import 'package:odinlab/widgets/custom_review_card.dart';

class Reviews extends StatelessWidget {
  final List<ReviewModel> courseReviews;

  const Reviews({super.key, required this.courseReviews});

  @override
  Widget build(BuildContext context) {
    // calculate avarage rating and breackdown dynamically
    final ratings = courseReviews.map((review) => review.reviewRating).toList();
    final averageRating = ratings.reduce((a, b) => a + b) / ratings.length;
    final Map<int, int> ratingBreakdown = {1: 0, 2: 0, 3: 0, 4: 0, 5: 0};
    for (var rating in ratings) {
      if (ratingBreakdown.containsKey(rating)) {
        ratingBreakdown[rating] = ratingBreakdown[rating]! + 1;
      }
    }

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
                Column(
                  children: [
                    Text(
                      averageRating.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
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
                    children: List.generate(
                      5,
                      (index) => _buildRatingBar(
                        5 - index,
                        ratingBreakdown[5 - index] ?? 0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // review cards

          Expanded(
            child: ListView.builder(
              itemCount: courseReviews.length,
              itemBuilder: (context, index) {
                final review = courseReviews[index];
                return CustomReviewCard(
                  name: review.reviewerName,
                  rating: review.reviewRating,
                  review: review.reviewText,
                  date: review.dynamicDate,
                );
              },
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
        SizedBox(
          width: 25,
          child: Text(
            "$star★",
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 14,
              color: kGreyColor,
            ),
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
        SizedBox(
          width: 30,
          child: Text(
            "$percentage%",
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 14,
              color: kGreyColor,
            ),
          ),
        ),
      ],
    );
  }
}
