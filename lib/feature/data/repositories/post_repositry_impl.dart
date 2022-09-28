import 'package:flutter_clean_arcitecture_post_app/core/error/exeption.dart';
import 'package:flutter_clean_arcitecture_post_app/core/network/network_info.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/data/data_source/post_local_data_source.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/data/data_source/post_remote_data_source.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/data/models/post_model.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/domain/entities/post_entity.dart';
import 'package:flutter_clean_arcitecture_post_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/domain/repositories/post_repository.dart';

class PostRepositoryImpl extends PostRepository {
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PostRepositoryImpl(
      {required this.networkInfo,
      required this.remoteDataSource,
      required this.localDataSource});

  @override
  Future<Either<Failure, List<PostEntity>>> getAllPost() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getAllPost();
        localDataSource.cachedPost(remotePosts);
        return Right(remotePosts);
      } on ServerExeption {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPosts = await localDataSource.getCachedPosts();
        return Right(localPosts);
      } on EmptyCachExeption {
        return Left(EmptyCaheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addPost(PostEntity post) async {
    final PostModel postModel =
        PostModel( title: post.title, body: post.body);
    return await _getMessage(() {
      return remoteDataSource.addPost(postModel);
    });
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int postId) async {
     return await _getMessage(() {
      return remoteDataSource.deletePost(postId);
    });
  }

  @override
  Future<Either<Failure, Unit>> updatePost(PostEntity post) async {
    final PostModel postModel =
        PostModel(id: post.id, title: post.title, body: post.body);
    return await _getMessage(() {
      return remoteDataSource.updatePost(postModel);
    });
  }

  Future<Either<Failure, Unit>> _getMessage(
      Future<Unit> Function() deleteOrUpdateOrAddPost) async {
    if (await networkInfo.isConnected) {
      try {
        await deleteOrUpdateOrAddPost;
        return Right(unit);
      } on ServerExeption {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
  
  
}
