import 'package:dartz/dartz.dart';
import 'package:flutter_client/features/greet/domain/repositories/greeting_repository.dart';
import '../../../shared/domain/usecases/usecases.dart';

class GetGreeting implements UseCase<Either<String, String>, GetGreetingParams> {
  final GreetingRepository repository;

  GetGreeting({required this.repository});

  @override
  call(GetGreetingParams params) async {
    return await repository.getGreeting(params.name);
  }
}

class GetGreetingParams extends Params {
  final String name;

  GetGreetingParams({required this.name});

  @override
  List<Object?> get props => [name];
}
