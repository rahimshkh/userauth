import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'controller/blocs/hive_bloc/hive_bloc.dart';
import 'controller/blocs/user_auth_bloc/user_auth_bloc.dart';
import 'controller/cubits/confirm_password_cubit.dart';
import 'controller/cubits/show_password_cubit.dart';
import 'controller/cubits/user_session_cubit.dart';
import 'helper/themes/app_theme.dart';
import 'helper/utils/hive_utils.dart';
import 'helper/utils/routes.dart';

import 'controller/cubits/edit_form_cubit.dart';

void main() async {
  await HiveStorageManager.openHiveBox();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ShowPasswordCubit()),
          BlocProvider(create: (context) => ShowConfirmPasswordCubit()),
          BlocProvider(create: (context) => EditFormCubit()),
          BlocProvider(create: (context) => UserAuthBloc()),
          BlocProvider(create: (context) => HiveBloc()),
        ],
        child: MaterialApp(
          theme: themeData,
          home: userSession(),
          routes: routes,
        ));
  }
}
