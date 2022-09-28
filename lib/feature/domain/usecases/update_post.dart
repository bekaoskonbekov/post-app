import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arcitecture_post_app/core/error/failure.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/domain/entities/post_entity.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/domain/repositories/post_repository.dart';

class UpdatePostUseCase {
  final PostRepository repository;

  UpdatePostUseCase(this.repository);
  Future < Either<Failure,Unit>> call(PostEntity post) async {
    return await repository.updatePost(post);
  }
}