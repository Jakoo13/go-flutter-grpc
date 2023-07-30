import 'package:fixnum/fixnum.dart';
import 'package:flutter_client/features/calculator/data/models/answer_model.dart';
import 'package:flutter_client/features/greet/data/models/greeting_model.dart';
import 'package:flutter_client/proto/calculator/calculator.pbgrpc.dart';
import 'package:flutter_client/utils/grpc_flutter_client.dart';

import '../../proto/greet/greet.pbgrpc.dart';

abstract class GrpcHelper {
  Future<GreetingModel> getGreeting(String name);
  Stream<GreetingModel> streamGreetings(String name);
  Future<AnswerModel> addNumbers(int firstNumber, int secondNumber);
}

class GrpcHelperImpl implements GrpcHelper {
  GrpcFlutterClient grpcClient;
  var greetClient =
      GreetServiceClient(GrpcFlutterClient("127.0.0.1").clientChannel);
  var calcClient =
      CalculatorServiceClient(GrpcFlutterClient("127.0.0.1").clientChannel);

  GrpcHelperImpl({required this.grpcClient});

  @override
  Future<GreetingModel> getGreeting(String name) async {
    GreetRequest greetRequest = GreetRequest.create();
    greetRequest.firstName = name;
    GreetResponse response = await greetClient.greet(greetRequest);
    return GreetingModel(message: response.result);
  }

  @override
  Stream<GreetingModel> streamGreetings(String name) async* {
    GreetRequest greetRequest = GreetRequest.create();
    greetRequest.firstName = name;
    yield* greetClient.greetManyTimes(greetRequest).map((event) {
      return GreetingModel(message: event.result);
    });
  }

  @override
  Future<AnswerModel> addNumbers(int firstNumber, int secondNumber) async {
    CalculatorRequest calculatorRequest = CalculatorRequest.create();
    calculatorRequest.firstNumber = Int64(firstNumber);
    calculatorRequest.secondNumber = Int64(secondNumber);
    CalculatorResponse response =
        await calcClient.addNumbers(calculatorRequest);
    return AnswerModel(answer: response.result.toInt());
  }
}
