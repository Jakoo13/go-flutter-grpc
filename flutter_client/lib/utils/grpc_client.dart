import 'package:grpc/grpc.dart';

class GrpcClient {
  final ClientChannel _clientChannel;
  GrpcClient()
      : _clientChannel = ClientChannel(
          "localhost",
          port: 50051,
          options: const ChannelOptions(
            credentials: ChannelCredentials.insecure(),
          ),
        );

  ClientChannel get clientChannel => _clientChannel;
}
