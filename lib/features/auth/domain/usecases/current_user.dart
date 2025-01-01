import 'package:clean_architecture_and_bloc/core/error/failures.dart';
import 'package:clean_architecture_and_bloc/core/usecases/use_case.dart';
import 'package:clean_architecture_and_bloc/core/common/entities/user.dart';
import 'package:clean_architecture_and_bloc/features/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class CurrentUser implements UseCase<User, NoParams> {
  final AuthRepository authRepository;

  CurrentUser(this.authRepository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await authRepository.currentUser();
  }
}
