import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_client/features/blog/presentation/pages/create_blog_screen.dart';

import '../bloc/blogs/blogs_bloc.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  void initState() {
    super.initState();
    context.read<BlogsBloc>().add(GetBlogsStream());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blogs'),
      ),
      body: BlocBuilder<BlogsBloc, BlogsState>(
        builder: (context, state) {
          print(state);
          if (state is Adding) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is BlogsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is BlogsError) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is NewBlogsAdded) {
            return SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.blogs.length,
                      itemBuilder: (context, index) {
                        final blog = state.blogs[index];
                        return Card(
                          child: ListTile(
                            title: Text(blog.title),
                            subtitle: Text(blog.content),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CreateBlogScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green,
                        ),
                        child: const Center(
                          child: Text(
                            "Create Blog Screen",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    child: InkWell(
                      onTap: () {
                        print(context
                            .read<BlogsBloc>()
                            .streamSubscription!
                            .isPaused);
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green,
                        ),
                        child: const Center(
                          child: Text(
                            "stream paused?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
