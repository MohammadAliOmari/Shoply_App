import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoply_app/core/local/local_storge_user.dart';
import 'package:shoply_app/core/model/login/response_login.dart';
import 'package:shoply_app/core/model/profile/request_profile.dart';
import 'package:shoply_app/core/services/supabase_service.dart';
import 'package:shoply_app/features/edit_profile/repo/edit_profile_repo.dart';
import 'package:shoply_app/features/edit_profile/view_model/state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitialState());
  final _editProfileRepo = EditProfileRepo();
  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final addressController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  File? profileImage;
  void initControllers() {
    fullNameController.text = LocalStorageUser.instance.fullName;
    userNameController.text = LocalStorageUser.instance.userName;
    addressController.text = LocalStorageUser.instance.address;
  }

  Future<void> editProfile() async {
    if (state is EditProfileLoadingState) return;
    if (formKey.currentState!.validate()) {
      emit(EditProfileLoadingState());

      String? imageUrl = LocalStorageUser.instance.profileImage;
      if (profileImage != null) {
        imageUrl = await _uploadImage(image: profileImage);
      }

      final result = await _editProfileRepo.editProfile(
        uid: LocalStorageUser.instance.uid,
        request: RequestProfile(
          fullName: fullNameController.text.trim(),
          userName: userNameController.text.trim(),
          address: addressController.text.trim(),
          profileImage: imageUrl,
        ),
        profileImage: profileImage,
      );

      await result.fold(
        (l) async {
          emit(EditProfileErrorState(errorMessage: l));
        },
        (r) async {
          final updatedUser = ResponseLogin(
            uid: LocalStorageUser.instance.uid,
            email: LocalStorageUser.instance.email,
            fullName: fullNameController.text.trim(),
            userName: userNameController.text.trim(),
            address: addressController.text.trim(),
            profileImage: imageUrl,
          );

          await LocalStorageUser.instance.setUserData(
            responseLogin: updatedUser,
          );
          LocalStorageUser.instance.setUserinfo(responseLogin: updatedUser);

          profileImage = null;

          emit(
            EditProfileSuccessState(
              successMessage: 'Profile updated successfully',
            ),
          );
        },
      );
    }
  }

  Future<String?> _uploadImage({required File? image}) async {
    if (image != null) {
      final imageUrl = await UploadImageService.uplaodImage(imageFile: image);
      return imageUrl;
    } else {
      return null;
    }
  }

  void pickImage() async {
    final imageFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (imageFile != null) {
      profileImage = File(imageFile.path);
      emit(EditProfilePickImageState());
    }
  }

  void deleteImage() {
    profileImage = null;
    emit(EditProfilePickImageState());
  }

  @override
  Future<void> close() {
    fullNameController.dispose();
    userNameController.dispose();

    addressController.dispose();

    return super.close();
  }
}
