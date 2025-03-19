part of 'note_cubit.dart';

abstract class NoteState {}

class NoteInitial extends NoteState {}

class NoteLoading extends NoteState {}
class NoteCreated extends NoteState {}
class NoteUpdated extends NoteState {}

class NoteSuccess
    extends NoteState {
  final List<Note> notes;

  NoteSuccess({required this.notes});
}

class NoteFailure
    extends NoteState {
  final String message;

  NoteFailure({required this.message});
}