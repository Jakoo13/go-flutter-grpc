import 'package:grpc/grpc.dart';

class GrpcFlutterClient {
  final String _baseUrl;
  late ClientChannel clientChannel;

  GrpcFlutterClient(this._baseUrl) {
    var options = const ChannelOptions(
      credentials: ChannelCredentials.insecure(),
      idleTimeout: Duration(minutes: 1),
    );

    clientChannel = ClientChannel(
      _baseUrl,
      port: 50051,
      options: options,
    );
  }

//  ClientChannel getClient() {
//     return _clientChannel;
//   }
}
