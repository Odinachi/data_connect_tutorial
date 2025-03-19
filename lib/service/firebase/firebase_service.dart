import 'package:connect_note/dataconnect-generated/dart/note_connector/note.dart';

import '../../features/note/model/note_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final _firebaseAuth = FirebaseAuth.instance;
  final _noteConnector = NoteConnector.instance;

  Future<({bool? successful, String? error})> signUp(
      String email, String password, String name) async {
    try {
      final call = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (call.user != null) {
        final uid = call.user!.uid;
        await _noteConnector.createUser(uid: uid, email: email, name: name).execute();
        return (successful: true, error: null);
      }
     await _firebaseAuth.currentUser?.delete();
      return (successful: false, error: 'An error occurred');
    } catch (e) {
      if (e is FirebaseAuthException) {
        return (successful: null, error: e.message);
      }
      return (successful: null, error: e.toString());
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
