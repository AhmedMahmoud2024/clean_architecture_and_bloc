import 'package:clean_architecture_and_bloc/core/common/cubits/app_user_cubit.dart';
import 'package:clean_architecture_and_bloc/core/theme/theme.dart';
import 'package:clean_architecture_and_bloc/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_architecture_and_bloc/features/auth/presentation/pages/login_page.dart';
import 'package:clean_architecture_and_bloc/features/auth/presentation/pages/signup_page.dart';
import 'package:clean_architecture_and_bloc/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => serviceLocator<AppUserCubit>()),
    BlocProvider(create: (_) => serviceLocator<AuthBloc>()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthIsUserLoggedIn());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkThemeMode,
      home: BlocSelector<AppUserCubit, AppUserState, bool>(
        selector: (state) {
          return state is AppUserLoggedIn;
        },
        builder: (context, isLoggedIn) {
          if (isLoggedIn) {
            return const Scaffold(
              body: Center(
                child: Text('Home'),
              ),
            );
          }
          return const LoginPage();
        },
      ),
    );
  }
}
