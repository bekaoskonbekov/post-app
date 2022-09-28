import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arcitecture_post_app/core/error/failure.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/domain/repositories/post_repository.dart';

class DeletePostUseCase {
  final PostRepository repository;

  DeletePostUseCase(this.repository);
  Future < Either<Failure,Unit>> call(int postId) async {
    return await repository.deletePost(postId);
  }
}