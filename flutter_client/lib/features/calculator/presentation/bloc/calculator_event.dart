part of 'calculator_bloc.dart';

abstract class CalculatorEvent extends Equatable {
  const CalculatorEvent();

  @override
  List<Object> get props => [];
}

class AddNumbersEvent extends CalculatorEvent {
  final int firstNumber;
  final int secondNumber;

  const AddNumbersEvent({required this.firstNumber, required this.secondNumber});

  @override
  List<Object> get props => [firstNumber, secondNumber];
}
