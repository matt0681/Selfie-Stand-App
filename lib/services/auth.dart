import 'package:firebase_auth/firebase_auth.dart';


/// Support for the different login features.
class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Sign in anonymously
  Future signInAnon() async {
    try {
      AuthResult result = _auth.signInAnonymously() as AuthResult;
      FirebaseUser user = result.user;
      return user;
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email & password

  // register with email & password

  // sign out

}