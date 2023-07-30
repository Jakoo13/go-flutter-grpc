import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/presentation/widgets/custom_text_field.dart';
import '../bloc/greet_bloc.dart';

class StreamGreetingsPage extends StatefulWidget {
  const StreamGreetingsPage({super.key});

  @override
  State<StreamGreetingsPage> createState() => _StreamGreetingsPageState();
}

class _StreamGreetingsPageState extends State<StreamGreetingsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stream Greetings")),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          Form(
            key: _formKey,
            child: _nameField(context),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {
              context
                  .read<GreetBloc>()
                  .add(StreamGreetingsEvent(name: _nameController.text));
              setState(() {
                _formKey.currentState!.reset();
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 80),
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.lightBlue,
              ),
              child: const Center(
                child: Text(
                  "Stream Greetings",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Display each greeting from the stream as it comes in, but keep all previous ones
          BlocBuilder<GreetBloc, GreetState>(
            builder: (context, state) {
              if (state is GreetStreamLoaded) {
                return const StreamWidgetsSuccess();
              } else if (state is GreetStreamError) {
                return Text(state.message);
              } else {
                return const Center(child: Text("No greetings yet"));
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _nameField(context) {
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
      ),
    );
  }
}

class StreamWidgetsSuccess extends StatelessWidget {
  const StreamWidgetsSuccess({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GreetBloc, GreetState>(
      buildWhen: (previous, current) {
        if (current is GreetStreamLoaded) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: context.read<GreetBloc>().greetings.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.lightBlue,
              ),
              child: Center(
                child: Text(
                  context.read<GreetBloc>().greetings[index].message,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
