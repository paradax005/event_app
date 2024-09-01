import 'package:event_app/features/event/data/models/event_model.dart';
import 'package:event_app/global/translation/supported_languages.dart';
import 'package:flutter/material.dart';

class EventDetailsPage extends StatefulWidget {
  const EventDetailsPage({
    required this.eventModel,
    super.key,
  });

  final EventModel eventModel;

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.eventModel.name ?? '',
          style: theme.textTheme.displaySmall,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: [],
        ),
      ),
    );
  }
}
