import 'package:flutter/material.dart';
import 'package:shoply_app/core/utils/images/app_images.dart';
import 'package:shoply_app/core/utils/theme/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}
  final PageController controller = PageController(initialPage: 0);
class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // The PageView takes up the flexible space at the top
            Expanded(
              child: PageView(
                controller: controller,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center, // Centers the content within the page view
                    mainAxisSize: MainAxisSize.min, // Prevents excessive stretching
                    children: [
                      Image.asset(AppImages.onboardImage1),
                      const SizedBox(height: 24), // Explicit spacing between image and title
                      const Text(
                        'Onboarding Title 1', 
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12), // Explicit spacing between title and description
                      Text(
                        'Onboarding description 1', 
                        style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
                      ),
                    ],
                  ),    
                ],
              ),
            ),
            
            // Bottom controls section wrapped tightly with Padding instead of a free Column
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0, left: 20.0, right: 20.0), 
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SmoothPageIndicator(    
                    controller: controller,     
                    count: 3,
                    effect: WormEffect(
                      activeDotColor: AppColors.primaryColor, 
                      dotColor: Colors.green.shade100, 
                      dotHeight: 15, 
                      dotWidth: 15, 
                      spacing: 16,
                    ),      
                    onDotClicked: (index) {},
                  ),
                  const SizedBox(height: 24), // Tight explicit gap between dots and button
                  ElevatedButton(
                    
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50), // Set the button size
                      backgroundColor:AppColors.primaryColor, // Set the background color to green
                      foregroundColor: Colors.white, // Set the text color to white
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15), // Rounded corners for the button
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Next',style: TextStyle(fontSize: 20,),),
                  ),
                   const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Skip',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
