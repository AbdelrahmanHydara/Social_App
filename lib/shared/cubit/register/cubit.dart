import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/models/user_model.dart';
import 'package:social_app/shared/cubit/register/states.dart';

class RegisterCubit extends Cubit<RegisterStates>
{
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var usernameController = TextEditingController();
  var phoneController = TextEditingController();

  userRegister({
    required String email,
    required String password,
    required String username,
    required String phone,
    String? bio,
    String? image,
    String? cover,
})
  {
    emit(RegisterLoadingState());

    FirebaseAuth.instance.
    createUserWithEmailAndPassword(
        email: email,
        password: password).
    then((value)
    {
      userCreate(
          email: email,
          uId: value.user!.uid,
          username: username,
          phone: phone,
          cover: cover,
          image: image,
          bio: bio,
      );
    } ).
    catchError((error)
    {
      emit(RegisterErrorState(error.toString()));
    });
  }

  userCreate({
    required String email,
    required String uId,
    required String username,
    required String phone,
    String? bio,
    String? image,
    String? cover,
})
  {
    UserModel model = UserModel(
        email: email,
        username: username,
        phone: phone,
        uId: uId,
        image: 'https://media.premiumtimesng.com/wp-content/files/2023/02/FqCtNf-XgAMS_qj-e1677577598219.jpg',
        cover: 'https://ichef.bbci.co.uk/live-experience/cps/624/cpsprodpb/10D00/production/_128046886_lionelmessi.jpg',
        bio: 'Write your bio ...',
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value)
    {
      emit(CreateUserSuccessState());
    })
        .catchError((error)
    {
      emit(CreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;

  changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(RegisterChangePasswordVisibilityState());
  }

}