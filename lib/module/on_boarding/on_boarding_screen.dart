import 'package:flutter/material.dart';
import 'package:shoping_application/shared/network/local/cache_helper.dart';
import '../login/login_method.dart';
import '../../shared/components/components.dart';
import '../../shared/network/style/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<Map<String, dynamic>> pages = [
    {
      'image': 'assets/images/0_1_(13).jpeg',
      'title': 'World of perfection',
      'subTitle':
          'Feel like you are a queen in the world of perfection, to find your best fits.'
    },
    {
      'image': 'assets/images/0_3_(12).png',
      'title': 'More than just a mall',
      'subTitle':
          'Exprience the shopping on clouds with Evira shopping card system and feel the perfection'
    },
    {
      'image': 'assets/images/0_1_(12).jpeg',
      'title': 'Gifts are here',
      'subTitle':
          'Direct gift senging system, You just need to buy it we deliver it to you beloved ones.'
    }
  ];

  void submit() {
    CacheHelper.saveData(key: 'onboarding', value: true).then((value) {
      if (value) {
        navigatorAndFinsh(
          context: context,
          widget: LoginMethod(),
        );
      }
    });
  }

  PageController controller = PageController();

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF42A5F5),
      backgroundColor: Color(0xFF3663eb),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (index) {
                if (index == pages.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                }
              },
              controller: controller,
              itemBuilder: (context, index) =>
                  customeOnboarding(model: pages[index]),
              itemCount: pages.length,
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: Color(0xff101010),
              dotHeight: 10,
              dotWidth: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.all(24),
            child: Row(
              children: [
                TextButton(
                    onPressed: () {
                      submit();
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: subtextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    )),
                Spacer(),
                MaterialButton(
                    onPressed: () {
                      if (isLast) {
                        submit();
                      } else {
                        controller.nextPage(
                          duration: (Duration(seconds: 1)),
                          curve: Curves.decelerate,
                        );
                      }
                    },
                    color: Color(0xff101010),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    height: 54,
                    child: Text(
                      isLast ? 'Get Started' : 'Next',
                      style: TextStyle(
                        color: subtextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

 // Text('ooo',style: TextStyle(color: Colors.deepOrange),),

