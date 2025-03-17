import 'package:connect_note/features/note/model/note_model.dart';

class DataConnectService {

  void createNote() {
    // Call the repository to create a note
    // If successful, fetch notes
    // If failure, emit NoteFailure
  }
  void deleleteNote(String noteId) {
    // Call the repository to delete a note
    // If successful, fetch notes
    // If failure, emit NoteFailure
  }
  void updateNote(Note note) {
    // Call the repository to update a note
    // If successful, fetch notes
    // If failure, emit NoteFailure
  }
  void fetchNotes() {
    // Call the repository to fetch notes
    // If successful, emit NoteSuccess
    // If failure, emit NoteFailure
  }
}