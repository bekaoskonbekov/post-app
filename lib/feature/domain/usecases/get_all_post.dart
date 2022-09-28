import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arcitecture_post_app/core/error/failure.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/domain/entities/post_entity.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/domain/repositories/post_repository.dart';

class GetAllPostUseCase {
  final PostRepository repository;

  GetAllPostUseCase(this.repository);
  Future<Either<Failure, List<PostEntity>>> call() async {
    return await repository.getAllPost();
  }
}
