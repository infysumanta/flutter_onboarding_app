import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtubeblog/main.dart';
import 'package:youtubeblog/models/onboaarding.dart';
import 'package:youtubeblog/screens/signup_screens.dart';
import 'package:youtubeblog/utils/app_styles.dart';
import 'package:youtubeblog/utils/size_config.dart';
import 'package:youtubeblog/widget/widgets.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;

  final PageController _pageController = PageController(initialPage: 0);

  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 5),
      duration: const Duration(milliseconds: 400),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : kSecondaryColor,
        shape: BoxShape.circle,
      ),
    );
  }

  Future setSeenOnboard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    seenOnboard = await prefs.setBool('seenOnboard', true);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeV = SizeConfig.blockSizeV!;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 9,
                child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (value) => {
                          setState(() {
                            currentPage = value;
                          })
                        },
                    itemCount: onboardingContents.length,
                    itemBuilder: (context, index) => Column(
                          children: [
                            SizedBox(
                              height: sizeV * 5,
                            ),
                            Text(
                              onboardingContents[index].title,
                              style: kTitle,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: sizeV * 5,
                            ),
                            SizedBox(
                              height: sizeV * 50,
                              child: Image.asset(
                                onboardingContents[index].image,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(
                              height: sizeV * 5,
                            ),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(style: kBodyText1, children: [
                                const TextSpan(text: "WE CAN "),
                                TextSpan(
                                    text: "HELP YOU ",
                                    style: TextStyle(color: kPrimaryColor)),
                                const TextSpan(text: "TO BE A BETTER "),
                                const TextSpan(text: "VERSION OF "),
                                TextSpan(
                                    text: "YOURSELF ",
                                    style: TextStyle(color: kPrimaryColor)),
                              ]),
                            ),
                            SizedBox(
                              height: sizeV * 5,
                            ),
                          ],
                        )),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      currentPage == onboardingContents.length - 1
                          ? MyTextButton(
                              buttonName: "Get Started",
                              bgColor: kPrimaryColor,
                              onPressed: () => {
                                setSeenOnboard(),
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUnScreen()),
                                )
                              },
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                OnboardingNavBtn(
                                    name: "Skip",
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignUnScreen()),
                                      );
                                    }),
                                Row(
                                  children: List.generate(
                                      onboardingContents.length,
                                      (index) => dotIndicator(index)),
                                ),
                                OnboardingNavBtn(
                                    name: "Next",
                                    onPressed: () {
                                      _pageController.nextPage(
                                          duration:
                                              const Duration(milliseconds: 400),
                                          curve: Curves.easeInOut);
                                    })
                              ],
                            )
                    ],
                  ))
            ],
          ),
        ));
  }
}
