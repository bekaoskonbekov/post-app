import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arcitecture_post_app/core/error/failure.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/domain/entities/post_entity.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/domain/usecases/get_all_post.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetAllPostUseCase getAllPosts;
  PostBloc({required this.getAllPosts}) : super(PostInitial()) {
    on<PostEvent>((event, emit) async {
      if (event is GetAllPostEvent) {
        emit(LoadingPostState());
        final failureOrPosts = await getAllPosts();
        emit(_mapFailurePostState(failureOrPosts));
      } else if (event is RefreshPostEvent) {
        emit(LoadingPostState());
        final failureOrPosts = await getAllPosts();
        failureOrPosts.fold((failure) {
          emit(ErrorPostState(message: _mapFailureToMessage(failure)));
        }, (posts) {
          emit(LoadedPostState(posts: posts));
        });
      }
    });
  }
  PostState _mapFailurePostState(Either<Failure, List<PostEntity>> either) {
   return either.fold(
        (failure) => ErrorPostState(message: _mapFailureToMessage(failure)),
        (post) =>
      LoadedPostState(posts: post)
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "plese try again later";
      case EmptyCaheFailure:
        return "No Data";
      case OfflineFailure:
        return "Please Chec your internet Connection";

      default:
        return "Unexpected Error , Please try again later";
    }
  }
}
