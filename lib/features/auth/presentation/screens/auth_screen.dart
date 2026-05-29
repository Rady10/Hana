import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../bloc/user_bloc.dart';
import '../bloc/user_event.dart';
import '../bloc/user_state.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  static const String routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {
           if(state.status == UserStatus.error){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage ?? 'An error occurred'))
              );
            }
          },
          builder:(context, state) { 
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Hanashi',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    'assets/images/login_image.svg',
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Collaborate with your friends to craft unique stories together.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  const Spacer(flex: 2),
                  CustomButton(
                    text: 'Continue with Google',
                    textColor: AppColors.textColor,
                    backgroundColor: AppColors.secondaryColor,
                    onPressed: (){
                      context.read<UserBloc>().add(LoginWithGoogleEvent());
                    }
                  )
                ],
              ),
            );
          }
        )
      ),
    );
  }
}