import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hana/core/theme/app_theme.dart';
import 'core/router/app_router.dart';
import 'core/services/get_it.dart';
import 'features/auth/presentation/bloc/user_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserBloc>(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.getTheme(),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
