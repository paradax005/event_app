import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:event_app/core/errors/exceptions.dart';
import 'package:event_app/core/errors/failures.dart';
import 'package:event_app/core/network/network_info.dart';
import 'package:event_app/features/event/data/datasources/remote_data_source/event_remote_data_source.dart';
import 'package:event_app/features/event/domain/repository/event_repository.dart';
import 'package:event_app/features/login/data/data_sources/local_data_source/auth_local_data_source.dart';

class EventRepositoryImpl implements EventRepository {
  EventRepositoryImpl({
    required this.eventRemoteDataSource,
    required this.authLocalDataSource,
    required this.networkInfo,
  });

  final EventRemoteDataSource eventRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  final NetworkInfo networkInfo;
  @override
  Future<Either<Failure, Unit>> createEvent({
    required String eventName,
    required String eventDate,
    required String eventLocation,
    required String eventPrice,
    required String eventAvailableTicket,
    required String eventDescription,
    File? eventImage,
  }) async {
    if (await networkInfo.isConnected == false) {
      return Left(ConnexionFailure());
    }
    try {
      final userId = await authLocalDataSource.getUserId();
      if (userId != null) {
        print('userId : $userId');
        final response = await eventRemoteDataSource.createEvent(
          userId: userId,
          eventName: eventName,
          eventDate: eventDate,
          eventLocation: eventLocation,
          eventPrice: eventPrice,
          eventAvailableTicket: eventAvailableTicket,
          eventDescription: eventDescription,
          eventImage: eventImage,
        );

        print('returning the response');

        return const Right(unit);
      }

      return Left(WrongEmailOrPasswordFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
