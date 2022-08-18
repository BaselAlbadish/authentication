import 'package:company_test/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../configure.dart';
import '../../../../../core/data/repository.dart';
import '../../../../../core/network/network_info.dart';
import '../../../../../core/utility/local_datasource/local_data_source.dart';
import '../../core/local_constant.dart';
import '../../domain/repositories/sign_in_repository.dart';
import '../data_source/sign_in_remote_data_source.dart';

class SignInRepositoryImpl extends BaseRepository implements SignInRepository {
  SignInRemoteDataSource signInRemoteDataSource;
  var local = getIt.get<LocalDataSource>();

  SignInRepositoryImpl({
    required this.signInRemoteDataSource,
    required NetworkInfo networkInfo,
  }) : super(networkInfo);

  @override
  Future<Either<Failure, User>> signInByGoogle() async{
    return safeCall(() async {
      final user = await signInRemoteDataSource.signInByGoogle();
      print(user);
      local.cacheValue(email, user.email);
      local.cacheValue(phoneNumber, user.phoneNumber);
      local.cacheValue(name, user.displayName);
      local.cacheValue(imageURL, user.photoURL);
      return right(user);
    });
  }

  @override
  Future<Either<Failure, User>> signInByFacebook() async{
    return safeCall(() async {
      final user = await signInRemoteDataSource.signInByFacebook();
      local.cacheValue(email, user.email);
      local.cacheValue(phoneNumber, user.phoneNumber);
      local.cacheValue(name, user.displayName);
      local.cacheValue(imageURL, user.photoURL);
      return right(user);
    });
  }

  @override
  Future<Either<Failure, User>> signInByTwitter() {
    // TODO: implement signInByTwitter
    throw UnimplementedError();
  }
}
