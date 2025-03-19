import 'package:connect_note/service/firebase/firebase_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.firebaseService}) : super(AuthStateInitial());
  final FirebaseService firebaseService;

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

  void signIn({required String email, required String password}) {
    emit(AuthLoading());
    // Call the repository to sign in
    // If successful, emit AuthAuthenticated
    // If failure, emit AuthFailure
  }

  void signOut() {
    // Call the repository to sign out
    // If successful, emit AuthUnauthenticated
    // If failure, emit AuthFailure
  }
}
