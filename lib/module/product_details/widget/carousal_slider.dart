import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shoping_application/layout/cubit/home_cubit.dart';
import 'package:shoping_application/shared/network/style/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarousalSlider extends StatelessWidget {
  final dynamic Function(int, CarouselPageChangedReason)? onPageChanged;
  final int currentIndex;
  final int productIndex;
  const CarousalSlider({
    super.key,
    required this.onPageChanged,
    required this.currentIndex,
    required this.productIndex,
  });

  @override
  Widget build(BuildContext context) {
    CarouselSliderController controller = CarouselSliderController();
    return CarouselSlider(
      carouselController: controller,
      items: HomeCubit.get(context)
          .homeModel
          ?.data
          ?.products?[productIndex]
          .images!
          .map((element) => Stack(
                children: [
                  Image(
                    image: NetworkImage(element),
                    width: double.infinity,
                    height: 350,
                    // fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              iconButton(
                                function: () {
                                  Navigator.pop(context);
                                },
                                icon: Icons.chevron_left,
                              ),
                              Spacer(),
                              iconButton(
                                function: () {},
                                icon: Icons.favorite,
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        AnimatedSmoothIndicator(
                          activeIndex: currentIndex,
                          count: HomeCubit.get(context)
                                  .homeModel
                                  ?.data
                                  ?.products?[productIndex]
                                  .images
                                  ?.length ??
                              0,
                          effect: ExpandingDotsEffect(
                            dotWidth: 10.0,
                            dotHeight: 3.0,
                            //Colors.blue
                            activeDotColor: primaryColor,
                            dotColor: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ))
          .toList(),
      options: option(),
    );
  }

/* -------------------------------------------------------------------------- */

  Widget iconButton({
    required IconData icon,
    required void Function() function,
  }) =>
      IconButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Color(0X7de0e0e0)),
        ),
        onPressed: function,
        icon: Icon(
          icon,
          color: primaryColor,
        ),
      );

  CarouselOptions option() => CarouselOptions(
        onPageChanged: onPageChanged,
        // autoPlay: true,
        height: double.infinity,
        autoPlayAnimationDuration: Duration(seconds: 1),
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayInterval: Duration(seconds: 3),
        viewportFraction: 1.0,
        reverse: false,
        initialPage: 0,
        enableInfiniteScroll: true,
      );
/* -------------------------------------------------------------------------- */
}
