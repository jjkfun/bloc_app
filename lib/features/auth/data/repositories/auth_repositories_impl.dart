import 'package:bloc_app/core/common/entities/user.dart';
import 'package:bloc_app/core/error/exceptions.dart';
import 'package:bloc_app/core/error/failure.dart';
import 'package:bloc_app/features/auth/data/data_course/auth_remote_data_course.dart';
import 'package:bloc_app/features/auth/domain/entities/user.dart';
import 'package:bloc_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

class AuthRepositoriesImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoriesImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, User>> loginWithEmailAndPassword(
      {required String email, required String password}) {
    return _getUser(() async => await remoteDataSource
        .loginWithEmailAndPassword(email: email, password: password));
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailAndPassword(
      {required String name,
      required String email,
      required String password}) async {
    // TODO: implement signUpWithEmailAndPassword
    return _getUser(
      () async => await remoteDataSource.signUpWithEmailAndPassword(
          name: name, email: email, password: password),
    );
  }

  Future<Either<Failure, User>> _getUser(
    Future<User> Function() fn,
  ) async {
    try {
      final userId = await fn();
      return right(userId);
    } on sb.AuthException catch (e) {
      return left(Failure(e.message));
    } on ServerException catch (e) {
      return left(
        Failure(
          e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, User>> currentUserData() async{
    try{
      final user = await remoteDataSource.getCurrentUserData();
      if (user == null){
        return left(Failure('Error'),);
      }
    }on ServerException catch(e){
      return left(Failure(e.message),);
    }
    throw UnimplementedError();
  }
}
