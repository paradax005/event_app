import 'package:event_app/features/home/data/models/event_model.dart';
import 'package:event_app/global/utils/const.dart';

abstract class EventSeeders {
  const EventSeeders._();

  static List<EventModel> eventList({
    int length = 5,
  }) {
    return List.generate(
      length,
      (index) => const EventModel(
        name: eventName,
        location: eventLocation,
        date: eventDate,
        numberTicket: ticketNumber,
        thumbImage: eventThumbnail,
        description: 'description',
        creatorName: 'creatorName',
        creatorLogo: 'creatorLogo',
        isVerified: true,
      ),
    );
  }
}
