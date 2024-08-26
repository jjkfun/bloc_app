import 'package:bloc_app/core/common/entities/user.dart';
import 'package:bloc_app/core/error/failure.dart';
import 'package:bloc_app/core/usecases/use_case.dart';
import 'package:bloc_app/features/auth/domain/entities/user.dart';
import 'package:bloc_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class UserLogin implements UseCases<User, UserLoginParams>{
  final AuthRepository authRepository;

   const UserLogin({required this.authRepository});

  @override
  Future<Either<Failure, User>> call(UserLoginParams params) async{
    return await authRepository.loginWithEmailAndPassword(email: params.email, password: params.password);
    throw UnimplementedError();
  }


}


class UserLoginParams{
  final String email;
  final String password;

  UserLoginParams({required this.email, required this.password});

}