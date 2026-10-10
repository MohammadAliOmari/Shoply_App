import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_dialog/pro_dialog.dart';
import 'package:shoply_app/core/routes/app_pages.dart';
import 'package:shoply_app/core/utils/theme/app_colors.dart';
import 'package:shoply_app/core/utils/widgets/custom_app_bar.dart';
import 'package:shoply_app/core/utils/widgets/custom_button.dart';
import 'package:shoply_app/core/utils/widgets/custom_dialog.dart';
import 'package:shoply_app/core/utils/widgets/custom_loading.dart';
import 'package:shoply_app/core/utils/widgets/custom_text_form_field.dart';
import 'package:shoply_app/features/signup/view_model/cubit.dart';
import 'package:shoply_app/features/signup/view_model/state.dart';

class SingupScreen extends StatelessWidget {
  const SingupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: Scaffold(
        appBar: CustomAppBar(titleText: 'Create Account'),
        body: BlocListener<SignUpCubit, SignUpState>(
          listener: (context, state) {
            if (state is SignUpLoadingState) {
              CustomLoading.showDialogLoading(context: context);
            } else if (state is SignUpErrorState) {
              Navigator.pop(context);
              CustomDialog.showCustomDialog(
                type: DialogType.error,
                context: context,
                title: 'Sign Up Error',
                description: state.errorMessage,
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            } else if (state is SignUpSuccessState) {
              Navigator.pop(context);
              CustomDialog.showCustomDialog(
                type: DialogType.success,
                context: context,
                title: 'Sign Up Success',
                description: state.successMessage,
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppPages.loginScreen,
                    (route) => false,
                  );
                },
              );
            }
          },
          child: Builder(
            builder: (context) {
              final cubit = context.read<SignUpCubit>();
              return SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Form(
                        key: context.read<SignUpCubit>().formKey,
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Join us and start shopping',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: 70,
                                      backgroundColor: Colors.grey.shade300,
                                      child: Icon(
                                        Icons.person_outline_rounded,
                                        size: 90,
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: CircleAvatar(
                                        radius: 20,
                                        backgroundColor: AppColors.primaryColor,
                                        child: Icon(
                                          Icons.camera_alt,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                CustomTextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your full name';
                                    }
                                    return null;
                                  },
                                  controller: cubit.fullNameController,
                                  hinText: 'Full Name',
                                  prefixIcon: Icon(
                                    Icons.person_outline_rounded,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                CustomTextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your user name';
                                    }
                                    return null;
                                  },
                                  controller: cubit.userNameController,
                                  hinText: 'User Name',
                                  prefixIcon: Icon(
                                    Icons.person_outline_rounded,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                CustomTextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    return null;
                                  },
                                  controller: cubit.emailController,
                                  hinText: 'Email',
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Colors.grey.shade700,
                                  ),
                                ),

                                CustomTextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your address';
                                    }
                                    return null;
                                  },
                                  controller: cubit.addressController,
                                  hinText: 'Address',
                                  prefixIcon: Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                CustomTextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    return null;
                                  },
                                  controller: cubit.passwordController,
                                  hinText: 'Password',
                                  prefixIcon: Icon(
                                    Icons.lock_outline_rounded,
                                    color: Colors.grey.shade700,
                                  ),
                                  obscureText: true,
                                ),
                                CustomTextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please confirm your password';
                                    }
                                    if (value !=
                                        cubit.passwordController.text) {
                                      return 'Passwords do not match';
                                    }
                                    return null;
                                  },
                                  controller: cubit.confirmPasswordController,
                                  hinText: 'Confirm Password',
                                  prefixIcon: Icon(
                                    Icons.lock_outline_rounded,
                                    color: Colors.grey.shade700,
                                  ),
                                  obscureText: true,
                                ),
                                CustomButton(
                                  buttonText: 'Sign Up',
                                  onPressed: () {
                                    cubit.signup();
                                  },
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: AppColors.onPrimary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 10),
                            Wrap(
                              children: [
                                Text(
                                  'Already have an account?',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
