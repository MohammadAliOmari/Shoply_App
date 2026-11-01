import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/utils/widgets/custom_app_bar.dart';
import 'package:shoply_app/core/utils/widgets/custom_button.dart';
import 'package:shoply_app/core/utils/widgets/custom_loading.dart';
import 'package:shoply_app/core/utils/widgets/custom_text_form_field.dart';
import 'package:shoply_app/features/change_password/view_model/cubit.dart';
import 'package:shoply_app/features/change_password/view_model/state.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) => ChangePasswordCubit(),

      child: Scaffold(
        appBar: CustomAppBar(titleText: 'Change Password'),

        body: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
          listener: (context, state) {
            if (state is ChangePasswordLoadingStatee) {
              return CustomLoading.showDialogLoading(context: context);
            } else if (state is ChangePasSuccessdInitStatee) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.sucssesmessage,
                    style: TextStyle(fontSize: 16),
                  ),
                  backgroundColor: Colors.green,
                ),
              );
              Navigator.pop(context);
            } else if (state is ChangePasswordErrorStatee) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error, style: TextStyle(fontSize: 16)),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            final cubit = context.read<ChangePasswordCubit>();
            return Form(
              key: cubit.formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      SizedBox(height: 15),
                      Center(
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: theme.cardColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.lock_outline_rounded,
                            size: 80,
                            color: theme.primaryColor,
                          ),
                        ),
                      ),

                      Center(
                        child: Text(
                          'Keep Your Account Secure',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                          'Update Your Password Regulary \nTo Keep your Account Safe',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 20),
                      CustomTextFormField(
                        controller: cubit.currentPassword,
                        hinText: 'Current Password',
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        controller: cubit.newPassword,
                        hinText: 'New Password',
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Newpassword';
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        controller: cubit.confirmNewPassword,
                        hinText: 'Confirm Password',
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your Newpassword';
                          }
                          if (value != cubit.newPassword.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),

                      CustomButton(
                        buttonText: 'Update Paswword',
                        onPressed: () {
                          cubit.changePassword();
                        },
                        fontSize: 25,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
