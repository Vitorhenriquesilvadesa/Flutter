import 'dart:convert';

import 'package:instagram/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<Post>> getAllPosts(int? userId) async {
    final url = userId == null
        ? "https://jsonplaceholder.typicode.com/posts"
        : "https://jsonplaceholder.typicode.com/posts?userId=$userId";

    final response = await http.get(Uri.parse(url));

    List<Post> posts = List.empty(growable: true);

    if (response.statusCode == 200) {
      List restList = jsonDecode(response.body);

      for (String mPost in restList) {
        posts.add(
          Post.fromJson(mPost),
        );
      }
    }

    return posts;
  }

  Future<Post?> newPost(Post post) async {
    const token = ""; //Colocar token aqui
    final Uri url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    final response = await http.post(url,
        headers: {"Authorization": "Bearer $token"}, body: post.toJson());

    if (response.statusCode == 200) {
      Post post = Post.fromJson(response.body);
      return post;
    } else {
      Exception("Falha na comunicaçao com o servidor.");
    }

    return null;
  }

  Future<Post?> editPost(Post post) async {
    String url = "https://jsonplaceholder.typicode.com/posts${post.id}";

    final response = await http.put(
      Uri.parse(url),
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: jsonEncode(
        post.toJson(),
      ),
    );

    if (response.statusCode == 200) {
      Post rPost = Post.fromJson(jsonDecode(response.body));

      return rPost;
    } else {
      Exception("Falha na conexão com o servidor.");
    }
    return null;
  }
}
