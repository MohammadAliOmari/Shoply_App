import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_dialog/pro_dialog.dart';
import 'package:shoply_app/core/routes/app_pages.dart';
import 'package:shoply_app/core/utils/images/app_images.dart';
import 'package:shoply_app/core/utils/theme/app_colors.dart';
import 'package:shoply_app/core/utils/widgets/custom_button.dart';
import 'package:shoply_app/core/utils/widgets/custom_dialog.dart';
import 'package:shoply_app/core/utils/widgets/custom_loading.dart';
import 'package:shoply_app/core/utils/widgets/custom_text_form_field.dart';
import 'package:shoply_app/features/login/view_model/cubit.dart';
import 'package:shoply_app/features/login/view_model/state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: BlocListener<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginLoadingState) {
                      CustomLoading.showDialogLoading(context: context);
                    } else if (state is LoginErrorState) {
                      Navigator.pop(context);
                      CustomDialog.showCustomDialog(
                        type: DialogType.error,
                        context: context,
                        title: 'Login Error',
                        description: state.errorMessage,
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                      );
                    } else if (state is LoginSuccessState) {
                      Navigator.pop(context);
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppPages.homeScreen,
                        (route) => false,
                      );
                    }
                  },
                  child: Builder(
                    builder: (context) {
                      final cubit = context.read<LoginCubit>();
                      return Form(
                        key: cubit.formKey,
                        child: Column(
                          children: [
                            SizedBox(height: 50),
                            Image(
                              image: AssetImage(AppImages.shoplySplashImage),
                              width: 250,
                              height: 200,
                            ),
                            Text(
                              'Welcom Back',
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Sign to countinue shopping',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            SizedBox(height: 20),
                            CustomTextFormField(
                              controller: cubit.emailController,
                              hinText: 'Email',
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            SizedBox(height: 5),
                            CustomTextFormField(
                              controller: cubit.passwordController,
                              hinText: 'Password',
                              prefixIcon: Icon(
                                Icons.lock_outline_rounded,
                                color: Colors.grey.shade700,
                              ),
                              obscureText: true,
                            ),
                            SizedBox(height: 10),
                            Align(
                              alignment: AlignmentGeometry.centerRight,
                              child: Text(
                                'ForgotPassword?',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            CustomButton(
                              buttonText: 'Login',
                              onPressed: () {
                                cubit.login();
                              },
                              style: TextStyle(
                                fontSize: 25,
                                color: AppColors.onPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10),
                            Wrap(
                              alignment: WrapAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have an account?',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppPages.signupScreen,
                                    );
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
