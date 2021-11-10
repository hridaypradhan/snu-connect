import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserCredential> signInWithGoogle(Function nullCallBack) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    if (googleAuth == null) nullCallBack();

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await _auth.signInWithCredential(credential);
  }

  signOut() async {
    await _auth.signOut();
    return await GoogleSignIn().disconnect();
  }

  writeUserData() {
    if (_auth.currentUser != null) {
      _firestore.collection('users').doc(_auth.currentUser?.email).set(
        {
          'name': _auth.currentUser?.displayName,
          'email': _auth.currentUser?.email,
          'phoneNumber': _auth.currentUser?.phoneNumber,
          'photoUrl': _auth.currentUser?.photoURL,
        },
      );
    }
  }
}
