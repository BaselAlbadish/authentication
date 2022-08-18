import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../../core/error/exceptions.dart';

abstract class SignInRemoteDataSource {
  Future<User> signInByGoogle();

  Future<User> signInByFacebook();

  Future<User> signInByTwitter();
}

class SignInRemoteDataSourceImpl implements SignInRemoteDataSource {
  FirebaseAuth firebaseAuth;

  SignInRemoteDataSourceImpl(this.firebaseAuth);

  @override
  Future<User> signInByGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final result = await firebaseAuth.signInWithCredential(credential);
      return result.user!;
    } on FirebaseAuthException catch (e) {
      throw FireBException(e.message);
    }
  }

  @override
  Future<User> signInByFacebook() async{
    try{
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(loginResult.accessToken!.token);
      final result = await firebaseAuth.signInWithCredential(facebookAuthCredential);
      return result.user!;
    }on FirebaseAuthException catch(e){
      throw FireBException(e.message);
    }
  }

  @override
  Future<User> signInByTwitter() {
    // TODO: implement signInByTwitter
    throw UnimplementedError();
  }
}
