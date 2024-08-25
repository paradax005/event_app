import 'package:connectivity/connectivity.dart';
import 'package:event_app/core/network/network_info.dart';
import 'package:event_app/features/login/data/data_sources/local_data_source/auth_local_data_source.dart';
import 'package:event_app/features/login/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:event_app/features/login/data/repository/auth_repository_impl.dart';
import 'package:event_app/features/login/domain/repository/auth_repository.dart';
import 'package:event_app/features/login/domain/usecases/auth_confirm_reset_code_use_case.dart';
import 'package:event_app/features/login/domain/usecases/auth_send_reset_code_use_case.dart';
import 'package:event_app/features/login/domain/usecases/auth_signin_usecase.dart';
import 'package:event_app/features/login/domain/usecases/auth_signup_usecase.dart';
import 'package:event_app/features/login/domain/usecases/auth_update_password_use_case.dart';
import 'package:event_app/features/login/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //*-------------------- Authentication module   --------------------
  // register bloc
  sl
    ..registerFactory(
      () => AuthBloc(
        authSignInUseCase: sl(),
        authSignUpUseCase: sl(),
        authSendResetCodeUseCase: sl(),
        authConfirmResetCodeUseCase: sl(),
        authUpdatePasswordUseCase: sl(),
      ),
    )

    // register use-cases
    ..registerLazySingleton(
      () => AuthSignInUseCase(
        repository: sl(),
      ),
    )
    ..registerLazySingleton(
      () => AuthSignUpUseCase(
        repository: sl(),
      ),
    )
    ..registerLazySingleton(
      () => AuthSendResetCodeUseCase(
        repository: sl(),
      ),
    )
    ..registerLazySingleton(
      () => AuthConfirmResetCodeUseCase(
        repository: sl(),
      ),
    )
    ..registerLazySingleton(
      () => AuthUpdatePasswordUseCase(
        repository: sl(),
      ),
    )
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        authRemoteDataSource: sl(),
        authLocalDataSource: sl(),
        networkInfo: sl(),
      ),
    )

    // register data sources
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        client: sl(),
      ),
    )
    ..registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(
        sharedPreferences: sl(),
      ),
    );

  //*-------------------- Core  --------------------

  //! Core
  final sharedPreferences = await SharedPreferences.getInstance();

  sl
    ..registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()))
    ..registerLazySingleton(http.Client.new)
    ..registerLazySingleton(() => sharedPreferences)
    ..registerLazySingleton(Connectivity.new);
}
