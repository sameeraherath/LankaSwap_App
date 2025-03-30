class OnboardingData {
  final String title;
  final String description;
  final String imagePath;

  OnboardingData({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  static List<OnboardingData> getOnboardingItems() {
    return [
      OnboardingData(
        title: 'Welcome to LankaSwap!',
        description:
            'Easily swap products with people across Sri Lanka. No hassle, just great deals!',
        imagePath: 'assets/welcome.png',
      ),
      OnboardingData(
        title: 'Swap Anything, Anytime',
        description:
            'From books to electronics, exchange what you don’t need for something you love!',
        imagePath: 'assets/swap.png',
      ),
      OnboardingData(
        title: 'Join Our Community',
        description: 'Connect with fellow swappers and start trading today!',
        imagePath: 'assets/.png',
      ),
    ];
  }
}
