part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class LoadingPostState extends PostState {}

class LoadedPostState extends PostState {
  final List<PostEntity> posts;

  const LoadedPostState({required this.posts});
  @override
  List<Object> get props => [posts];
}

class ErrorPostState extends PostState {
  final String message;

  const ErrorPostState({required this.message});
  @override
  List<Object> get props => [message];
}
