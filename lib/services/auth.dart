import 'package:firebase_auth/firebase_auth.dart';
import 'package:odinlab/models/user_model.dart';

class AuthServices {
  // firebase instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create a user from uid
  UserModel? _userWithFirebaseUserUid(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  // create the stream for checking the auth changes in the user
  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(_userWithFirebaseUserUid);
  }

  // signin anonymous
  Future signinAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userWithFirebaseUserUid(user);
    } catch (err) {
      return null;
    }
  }

  // signup using email & password
  Future signupWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userWithFirebaseUserUid(user);
    } catch (err) {
      return null;
    }
  }

  // signin using email & password
  Future signinWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userWithFirebaseUserUid(user);
    } catch (err) {
      return null;
    }
  }

  // signin using gmail

  // signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (err) {
      return null;
    }
  }
}
