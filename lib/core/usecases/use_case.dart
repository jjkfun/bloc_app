import 'package:bloc_app/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UseCases<SuccessType, Params>{
  Future<Either<Failure,SuccessType>> call(Params params);
}