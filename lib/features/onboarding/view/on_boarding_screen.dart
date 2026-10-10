import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/routes/app_pages.dart';
import 'package:shoply_app/core/utils/theme/app_colors.dart';
import 'package:shoply_app/core/utils/widgets/custom_button.dart';
import 'package:shoply_app/features/onboarding/view_model/cubit.dart';
import 'package:shoply_app/features/onboarding/view_model/state.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
part 'widgets/on_boarding_bottom.dart';
part 'widgets/on_boarding_header.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Column(children: [_OnBoardingHeader(), _OnBoardingBottom()]),
        ),
      ),
    );
  }
}
