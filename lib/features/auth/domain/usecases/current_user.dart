import 'package:bloc_app/core/common/entities/user.dart';
import 'package:bloc_app/core/error/failure.dart';
import 'package:bloc_app/core/usecases/use_case.dart';
import 'package:bloc_app/features/auth/domain/entities/user.dart';
import 'package:bloc_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class CurrentUser implements UseCases<User, NoParams>{
  final AuthRepository authRepository;

  CurrentUser({required this.authRepository});
  @override
  Future<Either<Failure, User>> call(params) async{
    return await authRepository.currentUserData();
    throw UnimplementedError();
  }

}

class NoParams{

}