import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:odinlab/models/course_model.dart';

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


/*  Stream<List<CourseModel>> get courses {
    return _courseCollection.snapshots().map((snapshot) => snapshot.docs.map((doc) => CourseModel.fromJson(doc.data(), doc.id)).toList());
  }
*/