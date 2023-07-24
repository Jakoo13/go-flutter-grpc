import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_client/features/greet/presentation/bloc/greet_bloc.dart';

import '../../../shared/presentation/widgets/custom_text_field.dart';

class GetGreetingPage extends StatefulWidget {
  const GetGreetingPage({super.key});

  @override
  State<GetGreetingPage> createState() => _GetGreetingPageState();
}

class _GetGreetingPageState extends State<GetGreetingPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Get Greeting"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<GreetBloc, GreetState>(
                builder: (context, state) {
                  if (state is GreetLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is GreetLoaded) {
                    return Text(state.entity.message);
                  } else if (state is GreetError) {
                    return Text(state.message);
                  } else {
                    return const Text("Greeting to appear here");
                  }
                },
              ),
              const SizedBox(
                height: 40,
              ),
              Form(
                key: _formKey,
                child: _emailField(context),
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  context
                      .read<GreetBloc>()
                      .add(GetGreetingEvent(name: _nameController.text));
                  setState(() {
                    _formKey.currentState!.reset();
                  });
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
                      "Get Greeting",
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
        ));
  }

  Widget _emailField(context) {
    return Align(
      child: CustomTextField(
        controller: _nameController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        labelText: "Enter Name",
        // onChanged: (value) =>
        //     context.read<LoginCubit>().emailChanged(value));
      ),
    );
  }
}
