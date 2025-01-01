import 'package:clean_architecture_and_bloc/core/error/failures.dart';
import 'package:clean_architecture_and_bloc/core/usecases/use_case.dart';
import 'package:clean_architecture_and_bloc/core/common/entities/user.dart';
import 'package:clean_architecture_and_bloc/features/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class UserLogin implements UseCase<User, UserLoginParamas> {
  final AuthRepository authRepository;

  UserLogin(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserLoginParamas params) async {
    return await authRepository.loginWithEmailPassword(
        email: params.email, password: params.password);
  }
}

class UserLoginParamas {
  final String email;
  final String password;

  UserLoginParamas({required this.email, required this.password});
}
