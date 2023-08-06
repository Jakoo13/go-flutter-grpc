import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/presentation/widgets/custom_text_field.dart';
import '../bloc/blog_item.dart/blog_item_bloc.dart';

class CreateBlogScreen extends StatefulWidget {
  const CreateBlogScreen({super.key});

  @override
  State<CreateBlogScreen> createState() => _CreateBlogScreenState();
}

class _CreateBlogScreenState extends State<CreateBlogScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _authorIdController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Create Blog"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<BlogItemBloc, BlogItemState>(
                builder: (context, state) {
                  if (state is BlogItemLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is CreateBlogItemSuccess) {
                    return Text("Blog Create ${state.blogId}");
                  } else if (state is BlogItemError) {
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
                    _authorIdField(context),
                    const SizedBox(height: 20),
                    _titleField(context),
                    const SizedBox(height: 20),
                    _contentField(context),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<BlogItemBloc>().add(
                          CreateBlogEvent(
                            id: _idController.text.toString(),
                            authorId: _authorIdController.text.toString(),
                            title: _titleController.text,
                            content: _contentController.text,
                          ),
                        );
                  }

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
                      "Create Blog",
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

  Widget _authorIdField(context) {
    return CustomTextField(
      controller: _authorIdController,
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
      labelText: "Author ID",
    );
  }

  Widget _titleField(context) {
    return CustomTextField(
      controller: _titleController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter string';
        }
        return null;
      },
      // inputFormatters: [
      //   FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
      // ],
      labelText: "Title",
    );
  }

  Widget _contentField(context) {
    return CustomTextField(
      controller: _contentController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter string';
        }
        return null;
      },
      // inputFormatters: [
      //   FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
      // ],
      labelText: "Content",
    );
  }
}
