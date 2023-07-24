part of 'greet_bloc.dart';

abstract class GreetEvent extends Equatable {
  const GreetEvent();

  @override
  List<Object> get props => [];
}

class GetGreetingEvent extends GreetEvent {
  final String name;

  const GetGreetingEvent({required this.name});

  @override
  List<Object> get props => [name];
}
