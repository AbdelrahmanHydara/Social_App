import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/auth/success/success_register.dart';
import 'package:social_app/modules/auth/widget/custom_material_button.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/components/default_text_form_field.dart';
import 'package:social_app/shared/cubit/register/cubit.dart';
import 'package:social_app/shared/cubit/register/states.dart';
import 'package:social_app/shared/style/icons/icon_broken.dart';
import 'package:social_app/shared/style/themes/app_colors/app_colors.dart';

class CustomTextFormFieldRegister extends StatelessWidget
{
  CustomTextFormFieldRegister({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterStates>(
        listener: (context,state) {},
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
                    height: 45,
                  ),
                  defaultTextFormField(
                    controller: RegisterCubit.get(context).usernameController,
                    labelText: 'Username',
                    hintText: 'Enter Your Username',
                    color: AppColors.primaryColor,
                    type: TextInputType.name,
                    suffix: IconBroken.Profile,
                    validate: (value)
                      {
                        if (value == null || value.isEmpty)
                        {
                          return 'Please enter Username';
                        }
                        return null;
                      }
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  defaultTextFormField(
                    controller: RegisterCubit.get(context).emailController,
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
                      }
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  defaultTextFormField(
                    controller: RegisterCubit.get(context).passwordController,
                    labelText: 'Password',
                    hintText: 'Enter Your Password',
                    color: AppColors.primaryColor,
                    type: TextInputType.visiblePassword,
                    suffix: IconBroken.Lock,
                    isPassword: RegisterCubit.get(context).isPassword,
                    suffixPressed: ()
                      {
                        RegisterCubit.get(context).changePasswordVisibility();
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
                  const SizedBox(
                    height: 25,
                  ),
                  defaultTextFormField(
                    controller: RegisterCubit.get(context).phoneController,
                    labelText: 'Phone',
                    hintText: 'Enter Your Phone',
                    color: AppColors.primaryColor,
                    type: TextInputType.phone,
                    suffix: IconBroken.Call,
                    validate: (value)
                    {
                      if (value!.isEmpty)
                      {
                        return 'please enter your phone number';
                      }
                      if(value.length > 11)
                      {
                        return 'Please enter phone number 11';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ConditionalBuilder(
                    condition: state is! RegisterLoadingState,
                    builder: (context) => CustomMaterialButtonAuth(
                      text: 'Sign Up',
                      onTap: ()
                      {
                        if(formKey.currentState!.validate())
                        {
                          RegisterCubit.get(context).userRegister(
                            email: RegisterCubit.get(context).emailController.text,
                            password: RegisterCubit.get(context).passwordController.text,
                            username: RegisterCubit.get(context).usernameController.text,
                            phone: RegisterCubit.get(context).phoneController.text,
                          );
                          navigateAndFinish(
                              context, const SuccessRegisterScreen()
                          );
                        }
                      },
                    ),
                    fallback: (context) => const Center(child: CircularProgressIndicator()),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
