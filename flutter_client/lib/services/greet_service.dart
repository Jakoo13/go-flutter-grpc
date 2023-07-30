

// class GreetService {

//   var client = GreetServiceClient(GrpcFlutterClient.getClient());
//   Future<GreetingModel> getGreeting() async {
//     GreetRequest greetRequest = GreetRequest.create();
//     greetRequest.firstName = "Flutter Client";
//     GreetResponse response = await client.greet(greetRequest);
//     print("RESPONE: ${response.result}");
//     return GreetingModel(message: response.result);
//   }
// }
