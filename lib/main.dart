import 'package:connect_note/dataconnect-generated/dart/note_connector/note.dart';
import 'package:connect_note/features/auth/cubit/auth_cubit.dart';
import 'package:connect_note/features/auth/views/login.dart';
import 'package:connect_note/features/note/cubit/note_cubit.dart';
import 'package:connect_note/firebase_options.dart';
import 'package:connect_note/service/data_connect/data_connect_service.dart';
import 'package:connect_note/service/firebase/firebase_service.dart';
import 'package:connect_note/shared/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  String host = 'localhost'; 
  int port = 9399;
  NoteConnector.instance.dataConnect.useDataConnectEmulator(host, port);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final  firebaseService = FirebaseService();
  final dateconnectService = DataConnectService();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(firebaseService: firebaseService, dataConnectService: dateconnectService),
        ),  BlocProvider<NoteCubit>(
          create: (context) => NoteCubit(),
        ),
       
      ],
      child: MaterialApp(
        navigatorKey: AppRouter.key,
        title: 'Note App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute:FirebaseAuth.instance.currentUser!=null?AppRouteString.home: AppRouteString.login,
      ),
    );
  }
}