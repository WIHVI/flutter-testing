import 'package:flutter/material.dart';
import 'package:flutter_testing/config/router/app_routes.dart';
import 'package:flutter_testing/models/post_model.dart';
import 'package:flutter_testing/services/networking.dart';
import 'package:go_router/go_router.dart';

class PostListScreen extends StatelessWidget {
  const PostListScreen({super.key});

  Future<List<PostModel>> getData() async {
    final List postList = await Networking.getData();

    final List<PostModel> postModelList =
        postList.map((post) => PostModel.fromJson(post)).toList();

    return postModelList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Post List Screen'),
      ),
      body: Center(
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final PostModel postModel = snapshot.data![index];
                  return ListTile(
                    title: Text(postModel.title),
                    onTap: () {
                      context.goNamed(
                        AppRoutes.postDetails.routeName,
                        pathParameters: <String, String>{
                          'id': postModel.id.toString(),
                        },
                        queryParameters: <String, String>{
                          'title': postModel.title,
                          'body': postModel.body,
                        },
                      );
                    },
                  );
                },
                itemCount: snapshot.data!.length,
              );
            }
          },
        ),
      ),
    );
  }
}
