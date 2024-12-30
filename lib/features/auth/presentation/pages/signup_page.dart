import 'package:clean_architecture_and_bloc/features/auth/presentation/widgets/auth_field.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: ((context) => const SignUpPage()));
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Sign up',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          AuthField(controller: nameController, hint: 'Name'),
          SizedBox(
            height: 15,
          ),
          AuthField(controller: emailController, hint: 'Email'),
          SizedBox(
            height: 15,
          ),
          AuthField(controller: passwordController, hint: 'Password'),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
