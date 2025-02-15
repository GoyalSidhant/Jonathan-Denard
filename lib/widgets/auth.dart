import 'package:firebase_auth/firebase_auth.dart';
import 'package:Jonathan_Denard/widgets/User.dart';
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  // create user object based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return (user != null) ? User(uid: user.uid) : null;
  }

  Future<String> resetEmail(String newEmail) async {
    String message='';
    FirebaseUser firebaseUser = await _auth.currentUser();
    firebaseUser
        .updateEmail(newEmail)
        .then(
          (value) => message = 'Success',
    )
        .catchError((e) => message = 'error');
    print(message);
    return message;
  }
  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}