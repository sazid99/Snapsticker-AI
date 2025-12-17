import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn.instance;

  Future<User?> signInWithGoogle() async {
    await _googleSignIn.initialize();

    final GoogleSignInAccount googleSignInAccount = await _googleSignIn
        .authenticate();
    final GoogleSignInAuthentication googleSignInAuthentication =
        googleSignInAccount.authentication;

    final OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential userCredential = await _auth.signInWithCredential(
      oAuthCredential,
    );
    return userCredential.user;
  }
}
