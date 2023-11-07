import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/cubit/login/states.dart';

class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  userLogin({
    required String email,
    required String password,
  })
  {
    emit(LoginLoadingState());

    FirebaseAuth.instance.
    signInWithEmailAndPassword(
        email: email,
        password: password).
    then((value)
    {
      emit(LoginSuccessState(value.user!.uid));
    } ).
    catchError((error)
    {
      emit(LoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;

  changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(LoginChangePasswordVisibilityState());
  }

}

