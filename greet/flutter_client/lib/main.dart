import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_client/features/greet/data/datasources/greeting_remote_datasource.dart';
import 'package:flutter_client/features/shared/presentation/pages/home_page.dart';

import 'features/greet/data/repositories/greeting_repository_impl.dart';
import 'features/greet/domain/usecases/get_greeting.dart';
import 'features/greet/domain/usecases/stream_greetings.dart';
import 'features/greet/presentation/bloc/greet_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GreetBloc(
            getGreeting: GetGreeting(
              repository: GreetingRepositoryImpl(
                remoteDatasource: GreetingRemoteDatasourceImpl(),
              ),
            ),
            streamGreetings: StreamGreetings(
              repository: GreetingRepositoryImpl(
                remoteDatasource: GreetingRemoteDatasourceImpl(),
              ),
            ),
          ),
        ),
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: HomePage(title: 'Grpc Demo'),
      ),
    );
  }
}
