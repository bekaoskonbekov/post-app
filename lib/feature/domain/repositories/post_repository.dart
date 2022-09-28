import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arcitecture_post_app/core/error/failure.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/domain/entities/post_entity.dart';

abstract class PostRepository {
 Future<Either<Failure, List<PostEntity>>> getAllPost();
 Future < Either<Failure,Unit>> deletePost(int id);
 Future < Either<Failure,Unit>>  updatePost(PostEntity post);
 Future < Either<Failure,Unit>>  addPost(PostEntity post);
}

