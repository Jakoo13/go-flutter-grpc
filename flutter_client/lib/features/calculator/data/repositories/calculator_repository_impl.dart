import 'package:dartz/dartz.dart';
import 'package:flutter_client/features/calculator/domain/entities/answer_entity.dart';

import '../../domain/repositories/calculator_repository.dart';
import '../../data/datasources/calculator_remote_datasource.dart';

class CalculatorRepositoryImpl implements CalculatorRepository {
  final CalculatorRemoteDatasource remoteDataSource;

  CalculatorRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<String, AnswerEntity>> addNumbers(
      int firstNumber, int secondNumber) async {
    try {
      final calculator =
          await remoteDataSource.addNumbers(firstNumber, secondNumber);
      return Right(calculator);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
