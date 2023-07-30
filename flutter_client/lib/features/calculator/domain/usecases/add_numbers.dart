import 'package:dartz/dartz.dart';
import '../../../shared/domain/usecases/usecases.dart';
import '../repositories/calculator_repository.dart';

class AddNumbers implements UseCase<Either<String, String>, AddNumbersParams> {
  final CalculatorRepository repository;

  AddNumbers({required this.repository});

  @override
  call(AddNumbersParams params) async {
    return await repository.addNumbers(params.firstNumber, params.secondNumber);
  }
}

class AddNumbersParams extends Params {
  final int firstNumber;
  final int secondNumber;

  AddNumbersParams({required this.firstNumber, required this.secondNumber});

  @override
  List<Object?> get props => [firstNumber, secondNumber];
}
