import 'package:clean_architecture_and_bloc/core/common/cubits/app_user_cubit.dart';
import 'package:clean_architecture_and_bloc/core/secrets/app_secret.dart';
import 'package:clean_architecture_and_bloc/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:clean_architecture_and_bloc/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:clean_architecture_and_bloc/features/auth/domain/repositories/auth_repository.dart';
import 'package:clean_architecture_and_bloc/features/auth/domain/usecases/current_user.dart';
import 'package:clean_architecture_and_bloc/features/auth/domain/usecases/user_login.dart';
import 'package:clean_architecture_and_bloc/features/auth/domain/usecases/user_sign_up.dart';
import 'package:clean_architecture_and_bloc/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'init_dapendencies.main.dart';
