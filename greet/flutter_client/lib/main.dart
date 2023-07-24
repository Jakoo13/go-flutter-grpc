import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_client/features/greet/data/datasources/greeting_remote_datasource.dart';

import 'features/greet/data/repositories/greeting_repository_impl.dart';
import 'features/greet/domain/usecases/get_greeting.dart';
import 'features/greet/presentation/bloc/greet_bloc.dart';
import 'features/greet/presentation/pages/get_greeting_page.dart';

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
          ),
        ),
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: MyHomePage(title: 'Grpc Demo'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GetGreetingPage(),
                  ),
                );
              },
              child: Container(
                width: 200,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.lightBlue,
                ),
                child: const Center(
                  child: Text(
                    "Greeting Page",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
