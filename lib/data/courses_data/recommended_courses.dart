import 'package:odinlab/models/course_model.dart';

List<CourseModel> recommendedCourses = [
  CourseModel(
    courseId: "4",
    courseCategory: "Software Development",
    courseTitle: "Data Science Essentials",
    courseDescription:
        "Kickstart your data science journey with practical Python and machine learning projects.",
    courseImageUrl: "https://example.com/images/data_science.jpg",
    courseRating: 4.6,
    courseEnrolledStudents: 8000,
    isCourseRecommended: false,
    courseAddedDate: DateTime(2024, 1, 15),
    isPremium: false,
  ),
  CourseModel(
    courseId: "5",
    courseCategory: "Software Development",
    courseTitle: "React for Web Developers",
    courseDescription:
        "Build dynamic web applications with React and modern tools.",
    courseImageUrl: "https://example.com/images/react.jpg",
    courseRating: 4.7,
    courseEnrolledStudents: 10000,
    isCourseRecommended: true,
    courseAddedDate: DateTime(2023, 12, 20),
    isPremium: false,
  ),
  CourseModel(
    courseId: "6",
    courseCategory: "Software Development",
    courseTitle: "Kotlin for Android Development",
    courseDescription:
        "Learn Android development with Kotlin and build native mobile apps.",
    courseImageUrl: "https://example.com/images/kotlin.jpg",
    courseRating: 4.5,
    courseEnrolledStudents: 9000,
    isCourseRecommended: true,
    courseAddedDate: DateTime(2024, 1, 10),
    isPremium: false,
  ),
];

class CourseCategorizer {
  final List<CourseModel> allCourses;

  CourseCategorizer(this.allCourses);

  List<CourseModel> getMostPopularCourses() {
    allCourses.sort(
        (a, b) => b.courseEnrolledStudents.compareTo(a.courseEnrolledStudents));
    return allCourses.take(5).toList();
  }

  List<CourseModel> getRecommendedCourses() {
    return allCourses.where((course) => course.isCourseRecommended).toList();
  }

  List<CourseModel> getRecentlyAddedCourses() {
    allCourses.sort((a, b) => b.courseAddedDate.compareTo(a.courseAddedDate));
    return allCourses.take(5).toList();
  }

  List<CourseModel> getTopRatedCourses() {
    allCourses.sort((a, b) => b.courseRating.compareTo(a.courseRating));
    return allCourses.take(5).toList();
  }
}
