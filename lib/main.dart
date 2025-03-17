import 'package:connect_note/features/auth/cubit/auth_cubit.dart';
import 'package:connect_note/features/auth/views/login.dart';
import 'package:connect_note/firebase_options.dart';
import 'package:connect_note/service/firebase/firebase_service.dart';
import 'package:connect_note/shared/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final  firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(firebaseService: firebaseService),
        ),
       
      ],
      child: MaterialApp(
        title: 'Note App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: AppRouteString.home,
      ),
    );
  }
}