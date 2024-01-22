import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:pv_smart_click/features/data/repository/auth_repository_impl.dart';
import 'package:pv_smart_click/features/data/sources/remote/api_service.dart';
import 'package:pv_smart_click/features/domain/repository/auth_repository.dart';
import 'package:pv_smart_click/features/domain/usecases/post_login.dart';
import 'package:pv_smart_click/features/presentation/bloc/login_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<ApiService>(ApiService(sl()));

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl()));

  //UseCases
  sl.registerSingleton<PostLoginUseCase>(PostLoginUseCase(sl()));

  //Blocs
  sl.registerFactory<LoginBloc>(() => LoginBloc(sl()));
}
