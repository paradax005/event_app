import 'dart:math';

import 'package:event_app/features/event/data/models/event_model.dart';
import 'package:event_app/global/utils/const.dart';
import 'package:faker/faker.dart';

abstract class EventSeeders {
  const EventSeeders._();

  static // Function to generate a random list of EventModel
      List<EventModel> generateRandomEvents({
    int count = 5,
  }) {
    final faker = Faker();
    final random = Random();

    return List.generate(count, (index) {
      return EventModel(
        user: faker.person.name(),
        name: faker.lorem.words(3).join(' '),
        date: DateTime.now()
            .add(Duration(days: random.nextInt(30)))
            .toIso8601String(),
        location: faker.address.city(),
        price: faker.randomGenerator.decimal(min: 10),
        availableTickets: faker.randomGenerator.integer(100, min: 1),
        description: faker.lorem.sentence(),
        eventCover: 'https://via.placeholder.com/150', // Placeholder image URL
        id: faker.guid.guid(),
        createdAt: DateTime.now().subtract(Duration(days: random.nextInt(10))),
        updatedAt: DateTime.now(),
      );
    });
  }
}
