import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoConnectivity implements NetworkInfo {
  final Connectivity connectivity;
  NetworkInfoConnectivity(this.connectivity);

  @override
  Future<bool> get isConnected async {
      final connectivityResult = await connectivity.checkConnectivity();
      if(connectivityResult == ConnectivityResult.none) {
        return false;
      }
      else {
        return true;
      }
  }
}
