import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../nartus_connectivity.dart';

class ConnectivityPlusServiceImpl extends ConnectivityService {
  @override
  Future<bool> get isConnected => _checkConnectivity();

  @override
  Stream<bool> get onConnectivityChange => _connectivityChange.stream;

  /// implementation
  final StreamController<bool> _connectivityChange = StreamController();

  late final Connectivity _connectivity;

  bool _currentConnectivity = false;

  ConnectivityPlusServiceImpl({Connectivity? connectivity}) {
    _connectivity = connectivity ?? Connectivity();

    _checkConnectivity().then((value) => _currentConnectivity = value);

    _connectivity.onConnectivityChanged.listen(_handleConnectivityChange);
  }

  void _handleConnectivityChange(ConnectivityResult result) async {
    final updatedConnectivity =
    await _checkConnectivity(connectivityResult: result);
    if (updatedConnectivity != _currentConnectivity) {
      _currentConnectivity = updatedConnectivity;
      _connectivityChange.add(_currentConnectivity);
    }
  }

  Future<bool> _checkConnectivity(
      {ConnectivityResult? connectivityResult}) async {
    final result =
        connectivityResult ?? await _connectivity.checkConnectivity();

    return result != ConnectivityResult.none;
  }
}