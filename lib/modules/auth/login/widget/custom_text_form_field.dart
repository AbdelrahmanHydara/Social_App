import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/home/home_screen.dart';
import 'package:social_app/modules/auth/widget/custom_material_button.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/components/default_text_form_field.dart';
import 'package:social_app/shared/cubit/login/cubit.dart';
import 'package:social_app/shared/cubit/login/states.dart';
import 'package:social_app/shared/network/local/cache_helper.dart';
import 'package:social_app/shared/style/icons/icon_broken.dart';
import 'package:social_app/shared/style/themes/app_colors/app_colors.dart';

class CustomTextFormFieldLogin extends StatelessWidget
{
  CustomTextFormFieldLogin({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer< LoginCubit, LoginStates>(
      listener: (context,state)
      {
        if(state is LoginSuccessState)
          {
            CacheHelper.savaData(
                key: 'uId',
                value: state.uId,
            ).then((value)
            {
              navigateAndFinish(context, const HomeScreen());
            });
          }
      },
      builder: (context,state)
      {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Form(
            key: formKey,
            child: Column(
                children:
                [
                  const SizedBox(
                    height: 35,
                  ),
                  defaultTextFormField(
                    controller: LoginCubit.get(context).emailController,
                    labelText: 'Email',
                    hintText: 'Enter Your Email',
                    color: AppColors.primaryColor,
                    type: TextInputType.emailAddress,
                    suffix: IconBroken.Message,
                    validate: (value)
                    {
                      if (value == null || value.isEmpty)
                      {
                        return 'Please enter some text';
                      }
                      if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                        return 'Please a valid Email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  defaultTextFormField(
                      controller: LoginCubit.get(context).passwordController,
                      labelText: 'Password',
                      hintText: 'Enter Your Password',
                      color: AppColors.primaryColor,
                      type: TextInputType.visiblePassword,
                      suffix: IconBroken.Lock,
                      isPassword: LoginCubit.get(context).isPassword,
                      suffixPressed: ()
                      {
                        LoginCubit.get(context).changePasswordVisibility();
                      },
                      validate: (value)
                      {
                        if (value == null || value.isEmpty)
                        {
                          return 'Please enter some text';
                        }
                        if(value.length <= 4)
                        {
                          return 'Please enter long password';
                        }
                        return null;
                      }
                  ),
                  CustomMaterialButtonAuth(
                    text: 'Sign In',
                    onTap: ()
                    {
                      if(formKey.currentState!.validate())
                      {
                        LoginCubit.get(context).userLogin(
                            email: LoginCubit.get(context).emailController.text,
                            password: LoginCubit.get(context).passwordController.text,
                        );
                      }
                    },
                  ),
                ]
            ),
          ),
        );
      },
      ),
    );
  }
}
