import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:odinlab/models/lesson_model.dart';
import 'package:odinlab/models/review_model.dart';

class CourseModel {
  final String courseId;
  final String courseCategory;
  final String courseName;
  final String courseAbout;
  final String courseDescription1;
  final String courseDescription2;
  final String courseDescription3;
  final String courseImage;
  final List<LessonModel> courseLessons;
  final List courseKeyFeatures;
  final int courseEnrolledStudents;
  final DateTime courseAddedDate;
  final bool isPremium;
  final double courseFee;
  final double courseRating;
  final List<ReviewModel> courseReviews;

  CourseModel({
    required this.courseId,
    required this.courseCategory,
    required this.courseName,
    required this.courseAbout,
    required this.courseDescription1,
    required this.courseDescription2,
    required this.courseDescription3,
    required this.courseImage,
    required this.courseLessons,
    required this.courseKeyFeatures,
    required this.courseEnrolledStudents,
    required this.courseAddedDate,
    required this.isPremium,
    required this.courseFee,
    required this.courseRating,
    required this.courseReviews,
  });

  // method to convert the firebase document in to a dart object
  factory CourseModel.fromJson(
    Map<String, dynamic> data,
    String id,
    List<LessonModel> lessons,
    List<ReviewModel> reviews,
  ) {
    return CourseModel(
      courseId: id,
      courseCategory: data["courseCategory"] ?? "",
      courseName: data["courseName"] ?? "",
      courseAbout: data["courseAbout"] ?? "",
      courseDescription1: data["courseDescription1"] ?? "",
      courseDescription2: data["courseDescription2"] ?? "",
      courseDescription3: data["courseDescription3"] ?? "",
      courseImage: data["courseImage"] ?? "",
      courseLessons: lessons,
      courseKeyFeatures: List<String>.from(data["courseKeyFeatures"] ?? []),
      courseEnrolledStudents: data["courseEnrolledStudents"] ?? 0,
      courseAddedDate: data["courseAddedDate"] != null
          ? (data["courseAddedDate"] as Timestamp).toDate()
          : DateTime.now(),
      isPremium: data["courseIsPremium"] ?? false,
      courseFee: data["courseFee"]?.toDouble() ?? 0.0,
      courseRating: data["courseRating"]?.toDouble() ?? 0.0,
      courseReviews: reviews,
    );
  }
}
