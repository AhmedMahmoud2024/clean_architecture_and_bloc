import 'package:clean_architecture_and_bloc/features/auth/domain/entities/user.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signUpWithEmailPassword({
    //String until make usermoel
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, User>> loginWithEmailPassword({
    required String name,
    required String email,
  });
  Future<Either<Failure, User>> getUser();
}
