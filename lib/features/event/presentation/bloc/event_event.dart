part of 'event_bloc.dart';

@immutable
abstract class EventEvent {}

class CreateEvent extends EventEvent {
  CreateEvent({
    required this.eventParams,
  });
  final CreateEventParams eventParams;
}
