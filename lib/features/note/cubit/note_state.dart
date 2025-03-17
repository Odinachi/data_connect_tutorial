part of 'note_cubit.dart';

abstract class NoteState {}

class NoteInitial extends NoteState {}

class NoteLoading extends NoteState {}

class NoteSuccess
    extends NoteState {
  final List<Note> notes;

  NoteSuccess(this.notes);
}

class NoteFailure
    extends NoteState {
  final String message;

  NoteFailure(this.message);
}