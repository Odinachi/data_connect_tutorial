import 'package:connect_note/features/note/model/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service/data_connect/data_connect_service.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  final dataConnectService = DataConnectService();

 

  void fetchNotes(String id) async {
    emit(NoteLoading());
    final call = await dataConnectService.fetchNotes(id);
    if (call.notes != null) {
      emit(NoteSuccess(notes: call.notes ?? []));
    } else {
      emit(NoteFailure(message: call.error ?? 'An error occurred'));
    }
  }

  void addNote({required String title, required String content, required String userId}) async{
     emit(NoteLoading());
    final call = await dataConnectService.createNote(title: title, content: content, userId: userId);
    if (call.note != null) {
      emit(NoteCreated());
    } else {
      emit(NoteFailure(message: call.error ?? 'An error occurred'));
    }
  }

  void updateNote(Note note) {
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
