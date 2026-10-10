part of '../on_boarding_screen.dart';

class _OnBoardingBottom extends StatelessWidget {
  const _OnBoardingBottom();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      buildWhen: (previous, current) => current is ChangePageIndexState,
      builder: (context, state) {
        final cubit = context.read<OnBoardingCubit>();
        return Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SmoothPageIndicator(
                controller: cubit.pageController,
                count: cubit.onboardingImages.length,
                effect: WormEffect(
                  spacing: 8.0,
                  radius: 20.0,
                  dotWidth: 16.0,
                  dotHeight: 16.0,
                  strokeWidth: 1.5,
                  dotColor: AppColors.primaryColor.withValues(alpha: 0.3),
                  activeDotColor: AppColors.primaryColor,
                ),
                onDotClicked: (index) {},
              ),
              const SizedBox(height: 24),
              CustomButton(
                buttonText: cubit.currentIndex != 2 ? 'Next' : 'Get Started',
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                onPressed: () {
                  if (cubit.currentIndex != 2) {
                    cubit.nextPage();
                  } else {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppPages.loginScreen,
                      (route) => false,
                    );
                    cubit.setShowOnBoarding();
                  }
                },
              ),
              const SizedBox(height: 10),
              if (cubit.currentIndex != 2)
                GestureDetector(
                  onTap: () {
                    cubit.skipToLastPage();
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
                  ),
                ),

              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
