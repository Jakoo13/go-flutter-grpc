import 'package:flutter_client/features/greet/data/models/greeting_model.dart';
import 'package:flutter_client/utils/grpc_flutter_client.dart';

import '../../proto/greet.pbgrpc.dart';

abstract class GrpcHelper {
  Future<GreetingModel> getGreeting(String name);
  Stream<GreetingModel> streamGreetings(String name);
}

class GrpcHelperImpl implements GrpcHelper {
  GrpcFlutterClient grpcClient;
  var client = GreetServiceClient(GrpcFlutterClient("127.0.0.1").clientChannel);

  GrpcHelperImpl({required this.grpcClient});

  @override
  Future<GreetingModel> getGreeting(String name) async {
    GreetRequest greetRequest = GreetRequest.create();
    greetRequest.firstName = name;
    GreetResponse response = await client.greet(greetRequest);
    return GreetingModel(message: response.result);
  }

  @override
  Stream<GreetingModel> streamGreetings(String name) async* {
    GreetRequest greetRequest = GreetRequest.create();
    greetRequest.firstName = name;
    yield* client.greetManyTimes(greetRequest).map((event) {
      return GreetingModel(message: event.result);
    });
  }
}
