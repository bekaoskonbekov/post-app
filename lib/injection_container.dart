import 'package:flutter_clean_arcitecture_post_app/core/network/network_info.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/data/data_source/post_local_data_source.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/data/data_source/post_remote_data_source.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/data/repositories/post_repositry_impl.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/domain/repositories/post_repository.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/domain/usecases/add_post.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/domain/usecases/delete_post.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/domain/usecases/get_all_post.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/domain/usecases/update_post.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/presentation/bloc/add_delete_update/add_delete_update_post_bloc.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/presentation/bloc/post/post_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;
Future<void> init() async {
  // bloc

  sl.registerFactory(() => PostBloc(getAllPosts: sl()));
  sl.registerFactory(() => AddDeleteUpdatePostBloc(
      addPost: sl(), updatePost: sl(), deletePost: sl()));

  //usecase

  sl.registerLazySingleton(() => GetAllPostUseCase(sl()));
  sl.registerLazySingleton(() => AddPostUseCase(sl()));
  sl.registerLazySingleton(() => DeletePostUseCase(sl()));
  sl.registerLazySingleton(() => UpdatePostUseCase(sl()));
  //Repository

  sl.registerLazySingleton<PostRepository>(() => PostRepositoryImpl(
      networkInfo: sl(), remoteDataSource: sl(), localDataSource: sl()));

  //DataSource

  sl.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<PostLocalDataSource>(
      () => PostLocalDataSourceImpl(sharedPreferences: sl()));

  ///core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
