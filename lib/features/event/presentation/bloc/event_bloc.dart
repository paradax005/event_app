import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:event_app/core/errors/failures.dart';
import 'package:event_app/features/event/domain/usecases/create_event_usecase.dart';
import 'package:event_app/global/utils/functions.dart';
import 'package:flutter/material.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  EventBloc({
    required CreateEventUseCase createEventUseCase,
  })  : _createEventUseCase = createEventUseCase,
        super(EventInitial()) {
    on<EventEvent>((event, emit) {});
    on<CreateEvent>(_createEvent);
  }

  final CreateEventUseCase _createEventUseCase;

  Future<void> _createEvent(
    CreateEvent event,
    Emitter<EventState> emit,
  ) async {
    emit(EventLoading());

    final result = await _createEventUseCase.call(event.eventParams);

    result.fold((failure) {
      print(failure.runtimeType);
      emit(
        EventFailure(
          isInternetFailure: failure.runtimeType == ConnexionFailure,
          message: mapFailureToString(failure),
        ),
      );
    }, (success) {
      emit(EventCreatedSuccessfully());
    });
  }
}
