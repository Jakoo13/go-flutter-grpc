part of 'greet_bloc.dart';

abstract class GreetState extends Equatable {
  const GreetState();  

  @override
  List<Object> get props => [];
}
class GreetInitial extends GreetState {}

class GreetLoading extends GreetState {}

class GreetLoaded extends GreetState {
  final GreetingEntitiy entity;

  const GreetLoaded({required this.entity});

  @override
  List<Object> get props => [entity];
}

class GreetError extends GreetState {
  final String message;

  const GreetError({required this.message});

  @override
  List<Object> get props => [message];
}