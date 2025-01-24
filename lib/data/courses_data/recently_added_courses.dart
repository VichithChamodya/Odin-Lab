import 'package:odinlab/models/course_model.dart';

List<CourseModel> recentlyAddedCourses = [
  CourseModel(
    courseId: "7",
    courseCategory: "Software Development",
    courseTitle: "AI for Everyone",
    courseDescription:
        "Understand the basics of AI and how it’s transforming industries.",
    courseImageUrl: "https://example.com/images/ai.jpg",
    courseRating: 4.4,
    courseEnrolledStudents: 5000,
    isCourseRecommended: false,
    courseAddedDate: DateTime(2024, 1, 22),
    isPremium: false,
  ),
  CourseModel(
    courseId: "8",
    courseCategory: "Software Development",
    courseTitle: "Full Stack Web Development",
    courseDescription:
        "Become a full-stack developer by mastering both front-end and back-end technologies.",
    courseImageUrl: "https://example.com/images/fullstack.jpg",
    courseRating: 4.8,
    courseEnrolledStudents: 7000,
    isCourseRecommended: false,
    courseAddedDate: DateTime(2024, 1, 18),
    isPremium: false,
  ),
  CourseModel(
    courseId: "9",
    courseCategory: "Software Development",
    courseTitle: "Cybersecurity Basics",
    courseDescription:
        "Learn how to protect systems, networks, and programs from cyber threats.",
    courseImageUrl: "https://example.com/images/cybersecurity.jpg",
    courseRating: 4.6,
    courseEnrolledStudents: 6000,
    isCourseRecommended: false,
    courseAddedDate: DateTime(2024, 1, 20),
    isPremium: false,
  ),
];
