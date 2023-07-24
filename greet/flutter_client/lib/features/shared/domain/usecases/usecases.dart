import 'package:equatable/equatable.dart';

// Ensures all our UseCases across our app are standardized

abstract class UseCase<Type, Params> {
  // Every subsequent UseCase we will need to override this call method
  call(Params params);
  // Future<Either<Failure, Type>> call(Params params);
}

abstract class Params extends Equatable {}

class NoParams extends Params {
  @override
  List<Object?> get props => [];
}
