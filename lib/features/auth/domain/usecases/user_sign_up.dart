import 'package:clean_architecture_and_bloc/core/error/failures.dart';
import 'package:clean_architecture_and_bloc/core/usecases/use_case.dart';
import 'package:clean_architecture_and_bloc/features/auth/domain/entities/user.dart';
import 'package:clean_architecture_and_bloc/features/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class UserSignUp implements UseCase<User, UserSignUpParamas> {
  final AuthRepository authRepository;

  UserSignUp(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserSignUpParamas params) async {
    return await authRepository.signUpWithEmailPassword(
        name: params.name, email: params.email, password: params.password);
  }
}

class UserSignUpParamas {
  final String name;
  final String email;
  final String password;

  UserSignUpParamas(
      {required this.name, required this.email, required this.password});
}
