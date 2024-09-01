import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:event_app/core/errors/exceptions.dart';
import 'package:event_app/global/utils/app_api.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

abstract class EventRemoteDataSource {
  Future<Unit> createEvent({
    required String userId,
    required String eventName,
    required String eventDate,
    required String eventLocation,
    required String eventPrice,
    required String eventAvailableTicket,
    required String eventDescription,
    File? eventImage,
  });
}

class EventRemoteDataSourceImpl implements EventRemoteDataSource {
  EventRemoteDataSourceImpl({
    required this.client,
  });
  final http.Client client;

  @override
  Future<Unit> createEvent({
    required String userId,
    required String eventName,
    required String eventDate,
    required String eventLocation,
    required String eventPrice,
    required String eventAvailableTicket,
    required String eventDescription,
    File? eventImage,
  }) async {
    // Parse the date string
    final format = DateFormat('dd.MM.yyyy');
    final dateTime = format.parse(eventDate);

    final request = http.MultipartRequest(
      'POST',
      Uri.parse(createEventUrl),
    );

    final headers = <String, String>{'Content-type': 'multipart/form-data'};

    request.headers.addAll(headers);

    // Set request fields
    request.fields['name'] = eventName;
    request.fields['user'] = userId;
    request.fields['date'] = dateTime.toIso8601String();
    request.fields['location'] = eventLocation;
    request.fields['price'] = eventPrice;
    request.fields['availableTickets'] = eventAvailableTicket;
    request.fields['description'] = eventDescription;

    // Add the file if provided
    if (eventImage != null) {
      print('event image is not null');
      print(eventImage);
      final mimeType =
          lookupMimeType(eventImage.path) ?? 'application/octet-stream';
      final imageStream = http.ByteStream(eventImage.openRead());
      final length = await eventImage.length();
      final imageFile = http.MultipartFile(
        'eventCover',
        imageStream,
        length,
        filename: eventImage.path.split('/').last,
        contentType: MediaType.parse(mimeType),
      );
      request.files.add(imageFile);
    }

    try {
      print('Trying to send request');
      print(request.files);
      final response =
          await request.send().timeout(const Duration(seconds: 60));

      // Extract response body
      final responseBody = await response.stream.bytesToString();
      print('Response status code: ${response.statusCode}');
      print('Response body: $responseBody');

      if (response.statusCode == 201) {
        return unit;
      } else {
        print('Failed with status code: ${response.statusCode}');
        throw ServerException();
      }
    } catch (e) {
      print('Error occurred: $e');
      throw ServerException();
    }
  }
}
