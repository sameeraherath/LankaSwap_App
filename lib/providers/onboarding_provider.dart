import 'package:flutter/material.dart';

class OnboardingProvider with ChangeNotifier {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  int get currentPage => _currentPage;
  PageController get pageController => _pageController;

  void setCurrentPage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  void nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void completeOnboarding(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Welcome to LankaSwap!')));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
