import 'package:dartz/dartz.dart';
import 'package:event_app/core/errors/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, Unit>> resetPassword({
    required String email,
  });

  Future<Either<Failure, Unit>> signUp({
    required String email,
    required String password,
    required String username,
    required String firstName,
    required String lastName,
  });

  Future<Either<Failure, Unit>> logOut();

  Future<Either<Failure, String?>> getToken();
}
