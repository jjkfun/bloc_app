import 'package:bloc_app/core/common/entities/user.dart';
import 'package:bloc_app/core/error/failure.dart';
import 'package:bloc_app/features/auth/data/models/user_models.dart';
import 'package:bloc_app/features/auth/domain/entities/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository{
  Future<Either<Failure, User>> signUpWithEmailAndPassword({
    required String name, required String email, required String password,
});

  Future<Either<Failure, User>> loginWithEmailAndPassword({
    required String email, required String password,
  });
  Future<Either<Failure, User>> currentUserData();

}