import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User?getCurrentUser(){
    return _auth.currentUser;
  }

// login
  Future<UserCredential> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      _firestore.collection("users").doc(userCredential.user!.uid).set({
        "email": userCredential.user!.email,
        "uid": userCredential.user!.uid,
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

// register
  Future<UserCredential> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      _firestore.collection("users").doc(userCredential.user!.uid).set({
        "email": userCredential.user!.email,
        "uid": userCredential.user!.uid,
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  // logout
  Future<void> signOut() async {
    return await _auth.signOut();
  }
}
