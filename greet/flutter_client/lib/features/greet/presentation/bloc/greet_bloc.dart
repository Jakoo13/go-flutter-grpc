import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_client/features/greet/domain/entities/greeting_entity.dart';

import '../../domain/usecases/get_greeting.dart';

part 'greet_event.dart';
part 'greet_state.dart';

class GreetBloc extends Bloc<GreetEvent, GreetState> {
  late GetGreeting getGreeting;
  GreetBloc({required this.getGreeting}) : super(GreetInitial()) {
    on<GetGreetingEvent>(_onGetGreeting);
  }

  _onGetGreeting(GetGreetingEvent event, Emitter<GreetState> emit) async {
    emit(GreetLoading());
    try {
      final response = await getGreeting.call(GetGreetingParams(name: event.name));
      response.fold(
        (l) => emit(GreetError(message: l)),
        (r) => emit(GreetLoaded(entity: r)),
      );
    } catch (e) {
      emit(GreetError(message: e.toString()));
    }
  }
}
