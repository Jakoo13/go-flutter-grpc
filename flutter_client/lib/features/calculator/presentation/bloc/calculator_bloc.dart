
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_client/features/calculator/domain/usecases/add_numbers.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  late AddNumbers addNumbers;
  CalculatorBloc({required this.addNumbers}) : super(CalculatorInitial()) {
    on<AddNumbersEvent>(_onAddNumbersEvent);
  }

  _onAddNumbersEvent(AddNumbersEvent event, Emitter<CalculatorState> emit) async {
    emit(CalculatorLoading());
    try {
      final response = await addNumbers.call(AddNumbersParams(
          firstNumber: event.firstNumber, secondNumber: event.secondNumber));
      response.fold(
        (l) => emit(CalculatorError(message: l)),
        (r) => emit(CalculatorLoaded(result: r.answer)),
      );
    } catch (e) {
      emit(CalculatorError(message: e.toString()));
    }
  }
}
