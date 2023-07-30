import 'package:dartz/dartz.dart';
import 'package:flutter_client/features/greet/domain/entities/greeting_entity.dart';
import 'package:flutter_client/features/greet/domain/repositories/greeting_repository.dart';
import '../../../shared/domain/usecases/usecases.dart';

class StreamGreetings
    implements UseCase<Either<String, String>, StreamGreetingsParams> {
  final GreetingRepository repository;

  StreamGreetings({required this.repository});

  @override
  Stream<Either<String,GreetingEntitiy>> call(StreamGreetingsParams params) {
    return repository.streamGreetings(params.name);
  }
}

class StreamGreetingsParams extends Params {
  final String name;

  StreamGreetingsParams({required this.name});

  @override
  List<Object?> get props => [name];
}
