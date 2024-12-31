import 'package:clean_architecture_and_bloc/core/theme/app_pallet.dart';
import 'package:clean_architecture_and_bloc/features/auth/presentation/pages/login_page.dart';
import 'package:clean_architecture_and_bloc/features/auth/presentation/widgets/auth_field.dart';
import 'package:clean_architecture_and_bloc/features/auth/presentation/widgets/auth_gradient_button.dart';
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
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign up',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
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
              AuthField(
                controller: passwordController,
                hint: 'Password',
                isObsecure: true,
              ),
              SizedBox(
                height: 15,
              ),
              AuthGradientButton(
                  buttonText: 'Sign Up',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  }),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, LoginPage.route());
                },
                child: RichText(
                  text: TextSpan(
                      text: 'Already have account ?',
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                            text: 'Sign In',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color: AppPallete.gradient2,
                                    fontWeight: FontWeight.bold))
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
