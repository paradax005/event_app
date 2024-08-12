import 'package:dartz/dartz.dart';
import 'package:event_app/core/errors/failures.dart';
import 'package:event_app/core/network/network_info.dart';
import 'package:event_app/features/login/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:event_app/features/login/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.networkInfo,
  });

  final AuthRemoteDataSource authRemoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, String?>> getToken() {
    // TODO: implement getToken
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> resetPassword({
    required String email,
  }) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signIn({
    required String email,
    required String password,
  }) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> signUp({
    required String email,
    required String password,
    required String username,
    required String firstName,
    required String lastName,
  }) async {
    if (await networkInfo.isConnected == false) {
      return Left(ConnexionFailure());
    }

    try {
      await authRemoteDataSource.signUp(
        email: email,
        password: password,
        username: username,
        firstName: firstName,
        lastName: lastName,
      );

      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
