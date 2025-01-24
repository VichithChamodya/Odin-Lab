import 'package:odinlab/models/course_model.dart';

List<CourseModel> mostPopularCourses = [
  CourseModel(
    courseId: "1",
    courseCategory: "Software Development",
    courseTitle: "Python for Beginners",
    courseDescription:
        "Learn Python programming from scratch with easy-to-follow lessons.",
    courseImageUrl: "https://example.com/images/python.jpg",
    courseRating: 4.8,
    courseEnrolledStudents: 12000,
    isCourseRecommended: true,
    courseAddedDate: DateTime(2023, 12, 1),
    isPremium: false,
  ),
  CourseModel(
    courseId: "2",
    courseCategory: "Software Development",
    courseTitle: "Flutter Development",
    courseDescription:
        "Build beautiful cross-platform apps using Flutter and Dart.",
    courseImageUrl: "https://example.com/images/flutter.jpg",
    courseRating: 4.7,
    courseEnrolledStudents: 15000,
    isCourseRecommended: false,
    courseAddedDate: DateTime(2023, 10, 5),
    isPremium: false,
  ),
  CourseModel(
    courseId: "3",
    courseCategory: "Software Development",
    courseTitle: "Mastering JavaScript",
    courseDescription:
        "Deep dive into JavaScript with hands-on projects and exercises.",
    courseImageUrl: "https://example.com/images/javascript.jpg",
    courseRating: 4.9,
    courseEnrolledStudents: 18000,
    isCourseRecommended: true,
    courseAddedDate: DateTime(2023, 11, 10),
    isPremium: false,
  ),
];
