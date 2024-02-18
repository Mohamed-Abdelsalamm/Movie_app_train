import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sql_train/core/utils/colors_styles.dart';
import 'package:sql_train/core/utils/text_styles.dart';
import 'package:sql_train/core/widgets/custom_button.dart';
import 'package:sql_train/core/widgets/custom_text_field.dart';
import 'package:sql_train/features/Signup/presentation/manger/signup_cubit.dart';
import 'package:sql_train/features/home/presentation/views/home_view.dart';
import 'package:sql_train/features/login/data/models/user_model.dart';
import 'package:sql_train/features/login/presentation/views/login_view.dart';

class SignupViewBody extends StatelessWidget {
  SignupViewBody({
    super.key,
  });

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("SignUp", style: TextStyles().textStyle32Bold),
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
                  }),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already Have An Account"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginView(),
                            ));
                      },
                      child: Text(
                        "Login Now",
                        style: TextStyles()
                            .textStyle14semiBold
                            .copyWith(color: ColorStyles.green),
                      )),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              CustomButton(
                title: "SIGN-UP",
                onPressed: () {
                  onSignupPressed(context);
                },
              ),
            ]),
      ),
    );
  }

  void onSignupPressed(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<SignupCubit>(context)
          .addUserToDatabase(
              user: User(
                  email: emailController.text.trim(),
                  password: passwordController.text))
          .then((value) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeView(),
            ));
      });
    }
  }
}
