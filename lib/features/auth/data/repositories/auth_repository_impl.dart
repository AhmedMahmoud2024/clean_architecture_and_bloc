import 'package:clean_architecture_and_bloc/core/common/entities/user.dart';
import 'package:clean_architecture_and_bloc/core/error/exceptions.dart';

import 'package:clean_architecture_and_bloc/core/error/failures.dart';
import 'package:clean_architecture_and_bloc/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:clean_architecture_and_bloc/features/auth/presentation/bloc/auth_bloc.dart';

import 'package:fpdart/src/either.dart';

import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, User>> currentUser() async {
    // remain offline/local using hive
    try {
      // return _getUser(() async=>

      final user = await remoteDataSource.getCurrentUserData();
      if (user == null) {
        return left(Failure('User not logged in'));
      } else {
        return right(user);
      }
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> loginWithEmailPassword(
      {required String email, required String password}) async {
    return _getUser(() async => await remoteDataSource.loginWithEmailPassword(
        email: email, password: password));
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    return _getUser(() async => await remoteDataSource.signUpWithEmailPassword(
        name: name, email: email, password: password));
  }
}

Future<Either<Failure, User>> _getUser(Future<User> Function() fn) async {
  try {
// the part of offline/cashed data checker

    final user = await fn();
    return right(user);
  } on ServerException catch (e) {
    return left(Failure(e.message));
  }
}
