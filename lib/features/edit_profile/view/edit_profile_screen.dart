import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/utils/widgets/custom_app_bar.dart';
import 'package:shoply_app/core/utils/widgets/custom_button.dart';
import 'package:shoply_app/core/utils/widgets/custom_loading.dart';
import 'package:shoply_app/core/utils/widgets/custom_text_form_field.dart';
import 'package:shoply_app/core/local/local_storge_user.dart';
import 'package:shoply_app/core/utils/widgets/custom_cashed_image.dart';
import 'package:shoply_app/features/edit_profile/view_model/cubit.dart';
import 'package:shoply_app/features/edit_profile/view_model/state.dart';
part 'widgets/edit_profile_headar.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocProvider(
      create: (context) => EditProfileCubit()..initControllers(),
      child: Scaffold(
        appBar: CustomAppBar(
          titleText: 'Edit Profile',
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: BlocConsumer<EditProfileCubit, EditProfileState>(
                  listenWhen: (previous, current) =>
                      current is EditProfileLoadingState ||
                      current is EditProfileSuccessState ||
                      current is EditProfileErrorState,
                  listener: (context, state) {
                    if (state is EditProfileLoadingState) {
                      CustomLoading.showDialogLoading(context: context);
                    } else if (state is EditProfileSuccessState) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(
                            content: Text(
                              state.successMessage,
                              style: TextStyle(fontSize: 16),
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );
                    } else if (state is EditProfileErrorState) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(
                            content: Text(
                              state.errorMessage,
                              style: TextStyle(fontSize: 16),
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                    }
                  },
                  builder: (context, state) {
                    final cubit = context.read<EditProfileCubit>();
                    return Form(
                      key: cubit.formKey,
                      child: Column(
                        children: [
                          Column(
                            children: [
                              _EditProfileHeader(),
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

                              CustomButton(
                                buttonText: 'Update Profile',
                                onPressed: () {
                                  final hasChanges =
                                      LocalStorageUser.instance.address !=
                                          cubit.addressController.text.trim() ||
                                      LocalStorageUser.instance.fullName !=
                                          cubit.fullNameController.text
                                              .trim() ||
                                      LocalStorageUser.instance.userName !=
                                          cubit.userNameController.text
                                              .trim() ||
                                      cubit.profileImage != null;

                                  if (hasChanges) {
                                    cubit.editProfile();
                                  } else {
                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(
                                        const SnackBar(
                                          content: Text('No changes found'),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                  }
                                },
                                style: TextStyle(
                                  fontSize: 25,
                                  color: theme.colorScheme.surface,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 10),
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
    );
  }
}
