
import 'package:connect_note/service/firebase/firebase_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';


class AuthCubit extends Cubit<AuthState>{
  AuthCubit({this.firebaseService}):super(AuthStateInitial());
  final  FirebaseService? firebaseService;

  void signUp({required String name, required String email, required String password,}){
    emit(AuthLoading());
    // Call the repository to sign up
    // If successful, emit AuthAuthenticated
    // If failure, emit AuthFailure
  }

  void signIn({required String email, required String password}){
    emit(AuthLoading());
    // Call the repository to sign in
    // If successful, emit AuthAuthenticated
    // If failure, emit AuthFailure
  }

  void signOut(){
    // Call the repository to sign out
    // If successful, emit AuthUnauthenticated
    // If failure, emit AuthFailure
  }

}