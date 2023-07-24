import 'package:flutter_client/features/greet/data/models/greeting_model.dart';

import '../../../../core/data_helper.dart';

abstract class GreetingRemoteDatasource {
  Future<GreetingModel> getGreeting(String name);
}

class GreetingRemoteDatasourceImpl implements GreetingRemoteDatasource {
   final _dataHelper = DataHelperImpl.instance;

  @override
  Future<GreetingModel> getGreeting(String name) async {
    final response = await _dataHelper.grpcHelper.getGreeting(name);

    GreetingModel greetingModel = GreetingModel(message: response.message);

    return greetingModel;
  }
}
