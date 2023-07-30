import 'package:equatable/equatable.dart';

class AnswerEntity extends Equatable {
  final int answer;

  const AnswerEntity({required this.answer});

  @override
  List<Object> get props => [answer];
}
