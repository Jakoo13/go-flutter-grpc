import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_client/features/greet/domain/entities/greeting_entity.dart';

import '../../domain/usecases/get_greeting.dart';
import '../../domain/usecases/stream_greetings.dart';

part 'greet_event.dart';
part 'greet_state.dart';

class GreetBloc extends Bloc<GreetEvent, GreetState> {
  late GetGreeting getGreeting;
  late StreamGreetings streamGreetings;
  GreetBloc({
    required this.getGreeting,
    required this.streamGreetings,
  }) : super(GreetInitial()) {
    on<GetGreetingEvent>(_onGetGreeting);
    on<StreamGreetingsEvent>(_onStreamGreetings);
  }

  _onGetGreeting(GetGreetingEvent event, Emitter<GreetState> emit) async {
    emit(GreetLoading());
    try {
      final response =
          await getGreeting.call(GetGreetingParams(name: event.name));
      response.fold(
        (l) => emit(GreetError(message: l)),
        (r) => emit(GreetLoaded(entity: r)),
      );
    } catch (e) {
      emit(GreetError(message: e.toString()));
    }
  }

  List<GreetingEntitiy> greetings = [];
  _onStreamGreetings(
      StreamGreetingsEvent event, Emitter<GreetState> emit) async {
    emit(GreetLoading());
    try {
      final response =
          streamGreetings.call(StreamGreetingsParams(name: event.name));
      await for (final Either<String, GreetingEntitiy> greeting in response) {
        greeting.fold(
          (l) {
            emit(
              GreetStreamError(message: l),
            );
          },
          (r) {
            greetings.add(r);
            emit(
              GreetStreamLoaded(message: r.message),
            );
          },
        );
      }
    } catch (e) {
      emit(GreetStreamError(message: e.toString()));
    }
  }

  
}
