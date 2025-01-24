import 'package:odinlab/models/course_model.dart';

List<CourseModel> topRatedCourses = [
  CourseModel(
    courseId: "10",
    courseCategory: "Software Development",
    courseTitle: "Advanced Python Programming",
    courseDescription:
        "Master advanced Python concepts and build complex applications.",
    courseImageUrl: "https://example.com/images/advanced_python.jpg",
    courseRating: 5.0,
    courseEnrolledStudents: 14000,
    isCourseRecommended: true,
    courseAddedDate: DateTime(2023, 9, 25),
    isPremium: false,
  ),
  CourseModel(
    courseId: "11",
    courseCategory: "Software Development",
    courseTitle: "UI/UX Design Masterclass",
    courseDescription:
        "Learn to design user-friendly interfaces and improve user experience.",
    courseImageUrl: "https://example.com/images/uiux.jpg",
    courseRating: 4.9,
    courseEnrolledStudents: 11000,
    isCourseRecommended: true,
    courseAddedDate: DateTime(2023, 8, 30),
    isPremium: false,
  ),
  CourseModel(
    courseId: "12",
    courseCategory: "Software Development",
    courseTitle: "Machine Learning with Python",
    courseDescription:
        "Implement machine learning algorithms with Python in practical use cases.",
    courseImageUrl: "https://example.com/images/ml.jpg",
    courseRating: 4.9,
    courseEnrolledStudents: 13000,
    isCourseRecommended: true,
    courseAddedDate: DateTime(2023, 7, 20),
    isPremium: false,
  ),
];
