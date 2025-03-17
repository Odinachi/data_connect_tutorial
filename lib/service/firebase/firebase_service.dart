import '../../features/note/model/note_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> signUp(
      String email, String password, String name) async {
    try {
      UserCredential userCredential = await _firebaseAuth
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

  Stream<User?> get user {
    return _firebaseAuth.authStateChanges();
  }


   Future<List<Note>> getNotes() async {
    try {
      

      return [];
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> createNote(String title, String content) async {
    try {
      
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> updateNote(Note note) async {
    

    
  }

  Future<void> deleteNote(String noteId) async {
    try {
     
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}