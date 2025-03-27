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
        title: 'Welcome to LankaSwap',
        description:
            'The first decentralized exchange on the Binance Smart Chain',
        imagePath: 'assets/welcome.png',
      ),
      OnboardingData(
        title: 'Swap Anything, Anytime',
        description: 'From books to gadgets, swap what you love.',
        imagePath: 'assets/swap.png',
      ),
      OnboardingData(
        title: 'Join the Community',
        description: 'Start swapping and be part of the movement!',
        imagePath: 'assets/community.png',
      ),
    ];
  }
}
