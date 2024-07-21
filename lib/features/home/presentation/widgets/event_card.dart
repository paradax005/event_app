import 'package:event_app/features/home/data/models/event_model.dart';
import 'package:event_app/global/views/widgets/global_button.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    required this.eventModel,
    super.key,
    this.buyTicket,
  });

  final EventModel eventModel;
  final void Function()? buyTicket;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 268,
      width: 290,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Image.network(
                eventModel.thumbImage,
                height: 127,
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(height: 7),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  eventModel.name,
                  style: theme.textTheme.displayMedium,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(eventModel.location),
                Text(eventModel.date),
                Text(eventModel.numberTicket),
              ],
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GlobalButton(
                onPressed: buyTicket,
                textContent: 'Buy Ticket',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
