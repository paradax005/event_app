import 'package:connectivity/connectivity.dart';
import 'package:event_app/core/network/network_info.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //*-------------------- Core  --------------------

  //! Core
  final sharedPreferences = await SharedPreferences.getInstance();

  sl
    ..registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()))
    ..registerLazySingleton(http.Client.new)
    ..registerLazySingleton(() => sharedPreferences)
    ..registerLazySingleton(Connectivity.new);
}
