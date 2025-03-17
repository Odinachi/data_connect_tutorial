import 'package:connect_note/features/note/model/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  void fetchNotes() {
    emit(NoteLoading());
    // Call the repository to fetch notes
    // If successful, emit NoteSuccess
    // If failure, emit NoteFailure
  }

  void addNote( Note note)  {
    // Call the repository to add a note
    // If successful, fetch notes
    // If failure, emit NoteFailure
  }

  void updateNote( Note note) {
    // Call the repository to update a note
    // If successful, fetch notes
    // If failure, emit NoteFailure
  }

  void deleteNote({String? noteId}) {
    // Call the repository to delete a note
    // If successful, fetch notes
    // If failure, emit NoteFailure
  }
}