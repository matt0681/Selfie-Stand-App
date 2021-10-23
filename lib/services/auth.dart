import 'package:app_development/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';


/// Support for the different login types.
class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create user object based on FireBaseUser
  CustomClassName? userFromFirebaseUser(User user) {
    return user != null ? CustomClassName(uid: user.uid) : null;
  }

  /// Sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
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
