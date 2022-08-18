import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/network/network_client.dart';
import 'core/network/network_info.dart';
import 'core/utility/local_datasource/local_data_source.dart';
import 'features/authentication/sign_in/data/data_source/sign_in_remote_data_source.dart';
import 'features/authentication/sign_in/data/repositories/sign_in_repository_impl.dart';
import 'features/authentication/sign_in/domain/repositories/sign_in_repository.dart';

final getIt = GetIt.instance;

Future<void> configureInjection() async {
  ///Network
  final connectionChecker = Connectivity();
  getIt.registerSingleton<NetworkInfo>(NetworkInfoConnectivity(connectionChecker));
  getIt.registerSingleton<NetworkClient>(NetworkClientDio());

  ///Data Source
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  getIt.registerSingleton<FirebaseAuth>(firebaseAuth);

  getIt.registerSingleton<LocalDataSource>(LocalDataSourceSharedPreferences(sharedPreferences));
  getIt.registerSingleton<SignInRemoteDataSource>(SignInRemoteDataSourceImpl(firebaseAuth));

  ///Repositories
  getIt.registerSingleton<SignInRepository>(SignInRepositoryImpl(
    networkInfo: getIt(),
    signInRemoteDataSource: getIt(),
  ));

}
