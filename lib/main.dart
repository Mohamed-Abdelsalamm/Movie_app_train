import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sql_train/core/database_provider.dart';
import 'package:sql_train/features/Signup/presentation/manger/signup_cubit.dart';
import 'package:sql_train/features/login/data/repo/login_repo_imple.dart';
import 'package:sql_train/features/login/presentation/manger/login_cubit.dart';
import 'package:sql_train/features/login/presentation/views/login_view.dart';

import 'features/Signup/data/repo/signup_repo_imple.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserDatabaseProvider.instance.open();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit(LoginRepoImplementation(UserDatabaseProvider()))),
        BlocProvider(create: (context) => SignupCubit(SignupRepoImplementation(UserDatabaseProvider()))),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginView(),
      ),
    );
  }
}


