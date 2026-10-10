part of '../on_boarding_screen.dart';

class _OnBoardingHeader extends StatelessWidget {
  const _OnBoardingHeader();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        final cubit = context.read<OnBoardingCubit>();

        return Expanded(
          flex: 2,
          child: PageView.builder(
            itemCount: cubit.onboardingImages.length,
            controller: cubit.pageController,
            onPageChanged: (index) {
              cubit.changePageIndex(index);
            },
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment
                    .center, // Centers the content within the page view
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Prevents excessive stretching
                children: [
                  Image.asset(cubit.onboardingImages[index], height: 400),
                  const SizedBox(height: 24),
                  Text(
                    cubit.onBoardTitle[index],
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    cubit.onBoardDescreption[index],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
