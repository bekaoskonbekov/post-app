import 'package:flutter_clean_arcitecture_post_app/feature/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  // ignore: prefer_const_constructors_in_immutables
  PostModel({ int? id, required String title, required String body})
      : super(id:id, title:title, body:body);

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(id: json['id'], title: json['title'], body: json['body']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "body": body,
      "title": title,
    };
  }
}
