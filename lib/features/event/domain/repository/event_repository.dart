import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:event_app/core/errors/failures.dart';

abstract class EventRepository {
  Future<Either<Failure, Unit>> createEvent({
    required String eventName,
    required String eventDate,
    required String eventLocation,
    required String eventPrice,
    required String eventAvailableTicket,
    required String eventDescription,
    File? eventImage,
  });
}
