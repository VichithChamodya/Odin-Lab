class LessonModel {
  final String lessonName;
  final String lessonVideo;
  final String lessonNote;

  LessonModel({
    required this.lessonName,
    required this.lessonVideo,
    required this.lessonNote,
  });

  factory LessonModel.fromJson(Map<String, dynamic> data) {
    return LessonModel(
      lessonName: data["lessonName"] ?? "",
      lessonVideo: data["lessonVideo"] ?? "",
      lessonNote: data["lessonNote"] ?? "",
    );
  }
}
