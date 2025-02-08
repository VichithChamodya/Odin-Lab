import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:odinlab/models/course_model.dart';
import 'package:odinlab/models/lesson_model.dart';
import 'package:odinlab/models/review_model.dart';

class CourseService {
  // reference to the firestore collection
  final CollectionReference _courseCollection =
      FirebaseFirestore.instance.collection("courses");

  // method to get all the courses from the firestore collection
  Stream<List<CourseModel>> getCourse() {
    return _courseCollection.snapshots().asyncMap((snapshot) async {
      return Future.wait(snapshot.docs.map((doc) async {
        final courseData = doc.data() as Map<String, dynamic>;

        // fetch lessons
        final lessonsSnapshot = await _courseCollection
            .doc(doc.id)
            .collection("courseLessons")
            .get();
        final lessons = lessonsSnapshot.docs
            .map((lessonDoc) => LessonModel.fromJson(lessonDoc.data()))
            .toList();

        // fetch reviews
        final reviewSnapshot = await _courseCollection
            .doc(doc.id)
            .collection("courseReviews")
            .get();
        final reviews = reviewSnapshot.docs
            .map((reviewDoc) => ReviewModel.fromJson(reviewDoc.data()))
            .toList();

        // create and return the CourseModel
        return CourseModel.fromJson(courseData, doc.id, lessons, reviews);
      }).toList());
    });
  }
}


/*
class CourseService {
  // reference to the firestore collection
  final CollectionReference _courseCollection =
      FirebaseFirestore.instance.collection("courses");

  // method to get all the courses from the firestore collection
  Stream<List<CourseModel>> getCourse() {
    return _courseCollection.snapshots().map((snapshot) => snapshot.docs
        .map((doc) =>
            CourseModel.fromJson(doc.data() as Map<String, dynamic>, doc.id))
        .toList());
  }
}
*/