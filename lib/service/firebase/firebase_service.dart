import '../../features/note/model/note_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> signUp(
      String email, String password, String name) async {
    try {
     final userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      
    
      
      return userCredential;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<UserCredential> signIn(String email, String password) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

}