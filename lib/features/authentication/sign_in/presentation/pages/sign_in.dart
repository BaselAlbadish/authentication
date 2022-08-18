import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../../configure.dart';
import '../../../../../core/errors_handle_function/errors_handle.dart';
import '../../../../../core/presentation/routes/routes.dart';
import '../../../../../core/presentation/widgets/app_bar.dart';
import '../../../../Home/presentation/pages/home.dart';
import '../../domain/repositories/sign_in_repository.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MainAppBar(context),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () async {
                  final res = await getIt<SignInRepository>().signInByFacebook();
                  if(res.isRight()){
                    navigateWithReplace(widget: Home(), context: context);
                  }
                },
                child: Image.asset(
                  "assets/images/faceook.png",
                  width: 70.w,
                  height: 70.h,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  final res = await getIt<SignInRepository>().signInByGoogle();
                  if(res.isRight()) {
                    navigateWithReplace(widget: Home(), context: context);
                  }

                  // res.fold(
                  //         (failure) =>
                  //             showDialog(
                  //     barrierDismissible: false,
                  //     builder: (context) => handleError(context, failure),
                  //     context: context),
                  //
                  // (user) {
                  //   navigateWithReplace(widget: Home(), context: context);
                  // }
                  // );
                },
                child: Image.asset(
                  "assets/images/google.png",
                  width: 70.w,
                  height: 70.h,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  // final twitterLogin = TwitterLogin(
                  //     apiKey: '<your consumer key>',
                  //     apiSecretKey: ' <your consumer secret>',
                  //     redirectURI: '<your_scheme>://');
                  //
                  // final authResult = await twitterLogin.login();
                  // final twitterAuthCredential = TwitterAuthProvider.credential(
                  //   accessToken: authResult.authToken!,
                  //   secret: authResult.authTokenSecret!,
                  // );
                  //
                  // await FirebaseAuth.instance.signInWithCredential(twitterAuthCredential);
                },
                child: Image.asset(
                  "assets/images/twitter.png",
                  width: 70.w,
                  height: 70.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
