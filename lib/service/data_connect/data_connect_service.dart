import 'package:connect_note/features/note/model/note_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_data_connect/firebase_data_connect.dart';

import '../../dataconnect-generated/dart/note_connector/note.dart';

class DataConnectService {
  final _noteConnector = NoteConnector.instance;

  Future<({Note? note, String? error})> createNote(
      {required String title,
      required String content,
      required String userId}) async {
    try {
      final call = await _noteConnector
          .createNote(title: title, content: content, userId: userId)
          .execute();
      return (
        note: Note(
          id: call.data.note_insert.id,
          title: title,
          content: content,
        ),
        error: null
      );
    } catch (e) {
      if (e is DataConnectError) {
        return (note: null, error: e.message);
      }
      return (note: null, error: e.toString());
    }
  }

  void deleleteNote(String noteId) async {
    // Call the repository to delete a note
    // If successful, fetch notes
    // If failure, emit NoteFailure
  }
  void updateNote(Note note) {
    // Call the repository to update a note
    // If successful, fetch notes
    // If failure, emit NoteFailure
  }
  Future<({List<Note>? notes, String? error})> fetchNotes(String id) async {
    try {
      final call = await _noteConnector.geUserNotes(id: id).execute();
      final notes = call.data.notes;

      return (
        notes: List<Note>.from(notes.map((e) => Note.fromMap(e.toJson()))),
        error: null
      );
    } catch (e) {
      if (e is DataConnectError) {
        return (notes: null, error: e.message);
      }
      return (notes: null, error: e.toString());
    }
  }


  Future<({GetUserUser? user, String? error})> fetchUser(
      ) async {
    try {
      final call = await _noteConnector
          .getUser(uid: FirebaseAuth.instance.currentUser?.uid??"")
          .execute();
      return (user: call.data.user, error: null);
    } catch (e) {
      if (e is DataConnectError) {
        return (user: null, error: e.message);
      }
      return (user: null, error: e.toString());
    }
  }
}
