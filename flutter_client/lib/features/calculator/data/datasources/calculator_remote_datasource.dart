import 'package:flutter_client/features/calculator/data/models/answer_model.dart';
import '../../../../core/data_helper.dart';

abstract class CalculatorRemoteDatasource {
  Future<AnswerModel> addNumbers(int firstNumber, int secondNumber);
}

class CalculatorRemoteDatasourceImpl implements CalculatorRemoteDatasource {
  final _dataHelper = DataHelperImpl.instance;

  @override
  Future<AnswerModel> addNumbers(int firstNumber, int secondNumber) async {
    final response =
        await _dataHelper.grpcHelper.addNumbers(firstNumber, secondNumber);

    AnswerModel answerModel = AnswerModel(answer: response.answer);

    return answerModel;
  }
}
