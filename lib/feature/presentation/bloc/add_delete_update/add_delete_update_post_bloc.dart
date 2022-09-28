import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arcitecture_post_app/core/error/failure.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/domain/entities/post_entity.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/domain/usecases/add_post.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/domain/usecases/delete_post.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/domain/usecases/update_post.dart';


part 'add_delete_update_post_event.dart';
part 'add_delete_update_post_state.dart';

class AddDeleteUpdatePostBloc
    extends Bloc<AddDeleteUpdatePostEvent, AddDeleteUpdatePostState> {
  final AddPostUseCase addPost;
  final UpdatePostUseCase updatePost;

  final DeletePostUseCase deletePost;
  AddDeleteUpdatePostBloc(
      {required this.addPost,
      required this.updatePost,
      required this.deletePost})
      : super(AddDeleteUpdatePostInitial()) {
    on<AddDeleteUpdatePostEvent>((event, emit) async {




      if (event is AddPostEvent) {
        emit(LoadingAddDeleteUpdatePostState());
        final failureOrDoneMessage = await addPost(event.post);
        emit(_eitherDoneMessageOrErrorState(
            failureOrDoneMessage, "Post Add Saccesful"));
      }
      
      
      
      
       else if (event is UpdatePostEvent) {
        emit(LoadingAddDeleteUpdatePostState());
        final failureOrDoneMessage = await updatePost(event.post);
        emit(_eitherDoneMessageOrErrorState(
            failureOrDoneMessage, "Post Update Saccesful"));
      } 
      
      
      
      else if (event is DeletePostEvent) {
        emit(LoadingAddDeleteUpdatePostState());
        final failureOrDoneMessage = await deletePost(event.postId);
        emit(_eitherDoneMessageOrErrorState(
            failureOrDoneMessage, "Post Delete Saccesful"));
      }
    });
  }

  AddDeleteUpdatePostState _eitherDoneMessageOrErrorState(
      Either<Failure, Unit> either, String message) {
    return either.fold(
        (failure) => ErrorAddDeleteUpdatePostState(
            message: _mapFailureToMessage(failure)),
        (_) => MessageAddDeleteUpdatePostState(message: message));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "plese try again later";

      case OfflineFailure:
        return "Please Chec your internet Connection";

      default:
        return "Unexpected Error , Please try again later";
    }
  }
}
