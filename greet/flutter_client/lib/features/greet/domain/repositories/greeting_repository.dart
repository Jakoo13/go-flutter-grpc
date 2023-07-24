import 'package:dartz/dartz.dart';
import 'package:flutter_client/features/greet/domain/entities/greeting_entity.dart';

abstract class GreetingRepository {
  Future<Either<String, GreetingEntitiy>> getGreeting(String name);
}
