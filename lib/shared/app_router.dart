import 'package:connect_note/features/auth/views/login.dart';
import 'package:connect_note/features/auth/views/sign_up.dart';
import 'package:connect_note/features/home/views/home.dart';
import 'package:connect_note/features/note/model/note_model.dart';
import 'package:connect_note/features/note/view/note.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

part 'app_route_string.dart';

class AppRouter {
  static final key = GlobalKey<NavigatorState>();

  static void push(String route, {Object? arg}) =>
      key.currentState?.pushNamed(route, arguments: arg);

  static void pop() => key.currentState?.pop();

  static void pushReplacement(String route, {Object? arg}) =>
      key.currentState?.pushReplacementNamed(route, arguments: arg);

  static void pushNamedAndRemoveUntil(String route, {Object? arg}) =>
      key.currentState
          ?.pushNamedAndRemoveUntil(route, (_) => false, arguments: arg);

  static Route generateRoute(RouteSettings route) {
    switch (route.name) {
      case AppRouteString.home:
        return CupertinoPageRoute(builder: (_) => HomeScreen());
      case AppRouteString.login:
        return CupertinoPageRoute(builder: (_) => LoginScreen());
        case AppRouteString.noteScreen:
        return CupertinoPageRoute(builder: (_) => NoteScreen(note: route.arguments as Note?,));
      case AppRouteString.signUp:
        return CupertinoPageRoute(builder: (_) => SignupScreen());
      default:
        return CupertinoPageRoute(builder: (_) => LoginScreen());
    }
  }
}
