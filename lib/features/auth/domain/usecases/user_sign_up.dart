import 'package:bloc_app/core/common/entities/user.dart';
import 'package:bloc_app/core/error/failure.dart';
import 'package:bloc_app/core/usecases/use_case.dart';
import 'package:bloc_app/features/auth/domain/entities/user.dart';
import 'package:bloc_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class UserSignUp implements UseCases<User,UserSignUpParams>{
 final AuthRepository authRepository;
 UserSignUp(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserSignUpParams params) async{
    return await authRepository.signUpWithEmailAndPassword(name: params.name, email: params.email, password: params.password);
    // TODO: implement call
    throw UnimplementedError();
  }
}



class UserSignUpParams{
  final String name;
  final String email;
  final String password;

  UserSignUpParams({required this.name, required this.email, required this.password});
}