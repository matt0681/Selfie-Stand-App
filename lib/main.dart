import 'package:app_development/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'authentication/authentication.dart';
import 'authentication/login.dart';

/// The main method which starts the entire app!
/// It creates an application state and starts up the UI.
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationState(),
      builder: (context, _) => const App(),
    ),
  );
}

/// The function runs the app from the first page.
/// It first routes to the login screen and then routes to the home screen.
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  /// The building of the UI.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Selfie Stand App",
      home: HomeScreen(),
    );
  }
}


/// This class handles the different authentication states and specifically
/// the communication between the firebase backend and the flutter front end.
class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

  Future<void> init() async {
    await Firebase.initializeApp();

    FirebaseAuth.instance.userChanges().listen((user) {
      if(user !=null) {
        _loginState = ApplicationLoginState.loggedIn;
      } else {
        _loginState = ApplicationLoginState.loggedOut;
      }
      notifyListeners();
    });
  }

  ApplicationLoginState _loginState = ApplicationLoginState.loggedOut;
  ApplicationLoginState get loginState => _loginState;

  String? _email;
  String? get email => _email;

  void startLoginFlow() {
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }

  void verifyEmail(
    String email,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      var methods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      if(methods.contains('password')) {
        _loginState = ApplicationLoginState.password;
      } else {
        _loginState = ApplicationLoginState.register;
      }
      _email = email;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void signInWithEmailAndPassword(
    String email,
    String password,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void cancelRegistration() {
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }

  void registerAccount(String email, String displayName, String password,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      var credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!.updateDisplayName(displayName);
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }
}








// import 'package:flutter/material.dart';
// import 'pages/home.dart';
// import 'authentication/login.dart';
//
// //
// // Left off at 18:00 - Enabling user sign in with Firebase auth.
// // https://firebase.flutter.dev/docs/overview
// //
// // https://firebase.google.com/codelabs/firebase-get-to-know-flutter#0
// //
//
// /// This function starts the entire app.
// /// It runs MainApp().
// void main() {
//   runApp(const MainApp());
// }
//
//
// /// The function runs the app from the first page.
// /// It first routes to the login screen and then routes to the home screen.
// class MainApp extends StatelessWidget {
//   const MainApp({Key? key}) : super(key: key);
//
//   /// The building of the UI.
//   ///
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Selfie Stand App",
//       home: HomeScreen(),
//       initialRoute: '/login',
//       onGenerateRoute: _getRoute,
//     );
//   }
//
//   Route<dynamic>? _getRoute(RouteSettings settings) {
//     if (settings.name != '/login') {
//       return null;
//     }
//
//     return MaterialPageRoute<void>(
//       settings: settings,
//       builder: (BuildContext context) => const LoginScreen(),
//       fullscreenDialog: true,
//     );
//   }
// }
