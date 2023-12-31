import 'package:dartz/dartz.dart';
import 'package:flutter_client/features/greet/data/datasources/greeting_remote_datasource.dart';
import 'package:flutter_client/features/greet/domain/entities/greeting_entity.dart';

import '../../domain/repositories/greeting_repository.dart';
import '../models/greeting_model.dart';

class GreetingRepositoryImpl implements GreetingRepository {
  final GreetingRemoteDatasource remoteDatasource;

  GreetingRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Either<String, GreetingEntity>> getGreeting(String name) async {
    try {
      final GreetingModel greeting = await remoteDatasource.getGreeting(name);
      return Right(GreetingEntity(message: greeting.message));
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Stream<Either<String, GreetingEntity>> streamGreetings(String name) async* {
    try {
      yield* remoteDatasource.streamGreetings(name).map((event) {
        return Right(GreetingEntity(message: event.message));
      });
    } catch (e) {
      yield Left(e.toString());
    }
  }
}
