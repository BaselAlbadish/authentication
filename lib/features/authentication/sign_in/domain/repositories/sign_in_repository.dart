import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/error/failures.dart';

abstract class SignInRepository{
  Future<Either<Failure, User>> signInByGoogle();
  Future<Either<Failure, User>> signInByFacebook();
  Future<Either<Failure, User>> signInByTwitter();
}
