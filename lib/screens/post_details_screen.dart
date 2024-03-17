import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen({
    super.key,
    required this.id,
    required this.title,
    required this.body,
  });

  final String id;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Post Details Screen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () => context.pop(),
            child: const Text('Go back'),
          ),
          const SizedBox(height: 24),
          Text('Id: $id'),
          const SizedBox(height: 24),
          Text('Title: $title'),
          const SizedBox(height: 24),
          Text('Body: $body'),
        ],
      ),
    );
  }
}
