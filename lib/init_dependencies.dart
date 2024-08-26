import 'package:bloc_app/core/common/cubit/app_user_cubit.dart';
import 'package:bloc_app/core/secrets/app_secrets.dart';
import 'package:bloc_app/features/auth/domain/usecases/current_user.dart';
import 'package:bloc_app/features/auth/domain/usecases/user_login.dart';
import 'package:bloc_app/features/auth/data/data_course/auth_remote_data_course.dart';
import 'package:bloc_app/features/auth/data/repositories/auth_repositories_impl.dart';
import 'package:bloc_app/features/auth/domain/repository/auth_repository.dart';
import 'package:bloc_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:bloc_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  initAuth();
  final supabase =
      await Supabase.initialize(url: AppSecrets.url, anonKey: AppSecrets.api);
  serviceLocator.registerLazySingleton(() => supabase.client);
  serviceLocator.registerLazySingleton(()=> AppUserCubit());
}

void initAuth() {
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataCourseImple(
      supabaseClient: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoriesImpl(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => UserSignUp(serviceLocator()),
  );
  serviceLocator.registerFactory(()=> CurrentUser(authRepository: serviceLocator(),),);
  serviceLocator
      .registerFactory(() => UserLogin(authRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(
    () => AuthBloc(
        userSignUp: serviceLocator(),
        userLogin: serviceLocator(),
        currentUser: serviceLocator(),
      appUserCubit: serviceLocator(),
    ),
  );
}
