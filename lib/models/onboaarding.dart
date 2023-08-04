class OnBoarding {
  final String title;
  final String image;
  OnBoarding({required this.title, required this.image});
}

List<OnBoarding> onboardingContents = [
  OnBoarding(
      title: 'Welcome to Youtube Blog',
      image: 'assets/images/onboarding_image_1.png'),
  OnBoarding(
      title: 'Watch your favourite videos',
      image: 'assets/images/onboarding_image_2.png'),
  OnBoarding(
      title: 'Subscribe to your favourite channels',
      image: 'assets/images/onboarding_image_3.png'),
  OnBoarding(
      title: 'Get notified about new videos',
      image: 'assets/images/onboarding_image_4.png'),
];
