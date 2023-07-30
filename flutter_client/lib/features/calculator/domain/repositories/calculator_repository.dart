import 'package:dartz/dartz.dart';
import 'package:flutter_client/features/calculator/domain/entities/answer_entity.dart';

abstract class CalculatorRepository {
  Future<Either<String, AnswerEntity>> addNumbers(
      int firstNumber, int secondNumber);
}
