import 'package:equatable/equatable.dart';

class GreetingEntity extends Equatable {
  final String message;

  const GreetingEntity({required this.message});

  @override
  List<Object> get props => [message];
}
