import 'package:connect_note/dataconnect-generated/dart/note_connector/note.dart';
import 'package:connect_note/service/data_connect/data_connect_service.dart';
import 'package:connect_note/service/firebase/firebase_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.firebaseService, required this.dataConnectService})
      : super(AuthStateInitial());
  final FirebaseService firebaseService;
  final DataConnectService dataConnectService;

  GetUserUser? user;

  void signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    final call = await firebaseService.signUp(email, password, name);
    if (call.successful ?? false) {
      emit(AuthAuthenticated());
    } else {
      emit(AuthFailure(call.error ?? 'An error occurred'));
    }
  }

  void signIn({required String email, required String password}) async {
    emit(AuthLoading());
    final call = await firebaseService.signIn(email, password);
    if (call.signedIn ?? false) {
      emit(AuthAuthenticated());
    } else {
      emit(AuthFailure(call.error ?? 'An error occurred'));
    }
  }

  void signOut() async {
    await firebaseService.signOut();
    emit(AuthUnauthenticated());
  }

  Future<GetUserUser?> fetchUser() async {
    final currentUser = (await dataConnectService.fetchUser()).user;

     print("state: $currentUser");
    if (currentUser != null) {
      user = currentUser;
      return currentUser;
    } else {
      emit(AuthUnauthenticated());
    }
  }
}
