import '../utils/grpc_flutter_client.dart';
import 'api/grpc_helper.dart';

abstract class DataHelper {
  setGrpcHelper(GrpcHelper grpcHelper);

  GrpcHelper get grpcHelper;
}

class DataHelperImpl implements DataHelper {
  DataHelperImpl._internal() {
    _grpcHelper = GrpcHelperImpl(
      grpcClient: GrpcFlutterClient("127.0.0.1"),
    );
  }

  static final DataHelperImpl _singleton = DataHelperImpl._internal();
  late GrpcHelper _grpcHelper;

  static DataHelperImpl get instance => _singleton;

  @override
  setGrpcHelper(GrpcHelper grpcHelper) {
    _grpcHelper = grpcHelper;
  }

  @override
  GrpcHelper get grpcHelper => _grpcHelper;
}
