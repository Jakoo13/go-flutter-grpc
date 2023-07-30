import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_client/features/calculator/presentation/bloc/calculator_bloc.dart';
import 'package:flutter_client/features/greet/presentation/bloc/greet_bloc.dart';

import '../../../shared/presentation/widgets/custom_text_field.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNumberController = TextEditingController();
  final TextEditingController _secondNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Calculator"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CalculatorBloc, CalculatorState>(
                builder: (context, state) {
                  if (state is GreetLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is CalculatorLoaded) {
                    return Text(state.result.toString());
                  } else if (state is CalculatorError) {
                    return Text(state.message);
                  } else {
                    return const Text("Answer to appear here");
                  }
                },
              ),
              const SizedBox(
                height: 40,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    _firstNumberField(context),
                    const SizedBox(height: 20),
                    _secondNumberField(context),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  context.read<CalculatorBloc>().add(AddNumbersEvent(
                      firstNumber: int.parse(_firstNumberController.text),
                      secondNumber: int.parse(_secondNumberController.text)));
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
                      "Add Numbers",
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

  Widget _firstNumberField(context) {
    return CustomTextField(
      controller: _firstNumberController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a number';
        }
        return null;
      },
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        FilteringTextInputFormatter.digitsOnly,
      ],
      labelText: "First Number",
    );
  }

  Widget _secondNumberField(context) {
    return CustomTextField(
      controller: _secondNumberController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a number';
        }
        return null;
      },
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        FilteringTextInputFormatter.digitsOnly,
      ],
      labelText: "Second Number",
    );
  }
}
