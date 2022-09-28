import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arcitecture_post_app/core/error/exeption.dart';
import 'dart:convert';
import 'package:flutter_clean_arcitecture_post_app/feature/data/models/post_model.dart';
import 'package:http/http.dart' as http;

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPost();
  Future<Unit> deletePost(int id);
  Future<Unit> updatePost(PostModel post);
  Future<Unit> addPost(PostModel post);
}

const BASE_URL = "https://jsonplaceholder.typicode.com";

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final http.Client client;

  PostRemoteDataSourceImpl({required this.client});
  @override
  Future<List<PostModel>> getAllPost() async {
    final response = await client.get(Uri.parse(BASE_URL + "/posts/"),
        headers: {"Content-Type": "aplication/json"});

    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;
      final List<PostModel> postModels = decodeJson
          .map<PostModel>((jsonPostModel) => PostModel.fromJson(jsonPostModel))
          .toList();
      return postModels;
    } else {
      throw ServerExeption();
    }
  }

  @override
  Future<Unit> addPost(PostModel postModel) async {
    final body = {
      "title": postModel.title,
      "bodyt": postModel.body,
    };
    final response =
        await client.post(Uri.parse(BASE_URL + "/posts/"), body: body);

    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerExeption();
    }
  }

  @override
  Future<Unit> deletePost(int postId) async {
    final response = await client.delete(
        Uri.parse(BASE_URL + "/posts/{postId.toString()}"),
        headers: {"Content-Type": "aplication/json"});
    if (response.statusCode == 200) {
      return Future.value(unit);
    }
    throw ServerExeption();
  }

  @override
  Future<Unit> updatePost(PostModel postModel) async {
    final postId = postModel.id.toString();
    final body = {
      "title": postModel.title,
      "bodyt": postModel.body,
    };
    final response =
        await client.post(Uri.parse(BASE_URL + "/posts/"), body: body);

    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerExeption();
    }
  }
}
