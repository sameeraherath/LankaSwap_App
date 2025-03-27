import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../models/onboarding_data.dart';
import '../providers/onboarding_provider.dart';
import '../widgets/onboarding_page.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnboardingProvider>(context);

    final onboardingItems = OnboardingData.getOnboardingItems();

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: provider.pageController,
            itemCount: onboardingItems.length,
            onPageChanged: (index) => provider.setCurrentPage(index),
            itemBuilder: (context, index) {
              return OnboardingPage(data: onboardingItems[index]);
            },
          ),

          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: provider.pageController,
                count: onboardingItems.length,
                effect: const WormEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  activeDotColor: Colors.blue,
                ),
              ),
            ),
          ),

          Consumer<OnboardingProvider>(
            builder: (context, provider, child) {
              return provider.currentPage == onboardingItems.length - 1
                  ? Positioned(
                    bottom: 30,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ElevatedButton(
                        onPressed: () => provider.completeOnboarding(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          minimumSize: const Size(50, 50),
                        ),
                        child: const Text('Get Started'),
                      ),
                    ),
                  )
                  : const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
