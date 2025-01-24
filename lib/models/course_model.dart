class CourseModel {
  final String courseId;
  final String courseCategory;
  final String courseTitle;
  final String courseDescription;
  final String courseImageUrl;
  final double courseRating;
  final int courseEnrolledStudents;
  final bool isCourseRecommended;
  final DateTime courseAddedDate;
  final bool isPremium;

  CourseModel({
    required this.courseId,
    required this.courseCategory,
    required this.courseTitle,
    required this.courseDescription,
    required this.courseImageUrl,
    required this.courseRating,
    required this.courseEnrolledStudents,
    required this.isCourseRecommended,
    required this.courseAddedDate,
    required this.isPremium,
  });
}
