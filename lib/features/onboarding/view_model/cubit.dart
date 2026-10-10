import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/local/local_storage.dart';
import 'package:shoply_app/core/utils/images/app_images.dart';
import 'package:shoply_app/features/onboarding/view_model/state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitialState());

  int currentIndex = 0;
  PageController pageController = PageController();
  final List<String> onboardingImages = [
    AppImages.onboardImage1,
    AppImages.onboardImage2,
    AppImages.onboardImage3,
  ];
  final List<String> onBoardTitle = [
    'Discover Amazing Products',
    'Shop Your Style',
    'Fast & Safe Delivery',
  ];
  final List<String> onBoardDescreption = [
    'Find everything you need in one place.',
    'Top brands, great prices and the latest trends.',
    'Get your orders delivered right to your doorstep.',
  ];

  void changePageIndex(int index) {
    currentIndex = index;
    log('Current Index: $currentIndex'); // Log the current index
    emit(ChangePageIndexState());
  }

  void nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void skipToLastPage() {
    pageController.animateToPage(
      onboardingImages.length - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void setShowOnBoarding() async {
    await LocalStorage.instance.setShowOnboarding(isShowOnboarding: true);
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
