import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sql_train/core/functions/functions.dart';
import 'package:sql_train/core/utils/colors_styles.dart';
import 'package:sql_train/core/utils/text_styles.dart';
import 'package:sql_train/core/widgets/custom_button.dart';
import 'package:sql_train/core/widgets/custom_text_field.dart';
import 'package:sql_train/features/Signup/presentation/views/signup_view.dart';
import 'package:sql_train/features/home/presentation/views/home_view.dart';
import 'package:sql_train/features/login/presentation/manger/login_cubit.dart';
import 'package:sql_train/features/login/presentation/manger/login_state.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({
    super.key,
  });

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is UserVerified) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeView(),
            ),
          );
          showCustomSnackBar(
            context,
            message: "Logged in Successfully",
          );
        } else if (state is WrongPassword) {
          showCustomSnackBar(
            context,
            message: "Wrong Password",
          );
        } else if (state is WrongEmail) {
          showCustomSnackBar(
            context,
            message: "Wrong Email",
          );
        } else if (state is LoginFailed) {
          showCustomSnackBar(
            context,
            message: "Ops, Try Again Later",
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Login", style: TextStyles().textStyle32Bold),
                const SizedBox(
                  height: 40,
                ),
                CustomTextField(
                    hintText: "Email",
                    controller: emailController,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 40,
                ),
                CustomTextField(
                  hintText: "Password",
                  controller: passwordController,
                  validator: (text) {
                    if (text!.isEmpty || text.length < 6) {
                      return 'Enter a valid password';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't Have An Account"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupView(),
                          ),
                        );
                      },
                      child: Text(
                        "Register Now",
                        style: TextStyles()
                            .textStyle14semiBold
                            .copyWith(color: ColorStyles.green),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                  title: "LOGIN",
                  onPressed: () {
                    onLoginPressed(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> onLoginPressed(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      await BlocProvider.of<LoginCubit>(context).getUsersDataDatabase(
          email: emailController.text, password: passwordController.text);
    }
  }
}
