import 'package:equatable/equatable.dart';

class GreetingEntitiy extends Equatable {
  final String message;

  const GreetingEntitiy({required this.message});

  @override
  List<Object> get props => [message];
}