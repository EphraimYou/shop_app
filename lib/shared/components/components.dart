import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shoping_application/model/home_model.dart';
import 'package:shoping_application/shared/components/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../network/style/colors.dart';

Widget customeOnboarding({required Map model}) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(model['image']), fit: BoxFit.cover),
                shape: BoxShape.circle),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(28, 0, 28, 10),
              child: Column(
                children: [
                  Text(
                    model['title'],
                    textAlign: TextAlign.center,
                    style: TextStyle(color: textForm, fontSize: 32, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    model['subTitle'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: textForm,
                      height: 1.5,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );

Future navigator({required context, required widget}) {
  return Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
}

Future navigatorAndFinish({required context, required widget}) {
  return Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => widget));
}

Widget signWith({required String title, required Widget leading, required VoidCallback onTapp}) =>
    InkWell(
      onTap: onTapp,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(
              color: Color(0xffEFEFEF),
              width: 1,
            )),
        child: ListTile(
            title: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(color: primaryColor, fontSize: 16, fontWeight: FontWeight.w500),
            ),
            leading: leading),
      ),
    );

Widget defaultButton({required VoidCallback onTap, required String title, IconData? icon}) =>
    SizedBox(
      height: 54,
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            elevation: 10,
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            )),
        label: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(color: subtextColor, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        icon: Icon(
          icon,
          color: subtextColor,
        ),
      ),
    );

Widget customTextFormField({
  required TextEditingController controller,
  required IconData prefixIcon,
  required validator,
  required String hintText,
  bool autofocus = false,
  bool obscureText = false,
  IconData? suffixIcon,
  VoidCallback? onTapSuffixIcon,
}) =>
    SizedBox(
      height: 45,
      child: TextFormField(
        validator: validator,
        controller: controller,
        autofocus: autofocus,
        obscureText: obscureText,
        cursorColor: primaryColor,
        style: TextStyle(color: primaryColor, fontWeight: FontWeight.w500, fontSize: 16),
        decoration: InputDecoration(
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
            hintText: hintText,
            hintStyle: TextStyle(
              color: secondaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: secondaryColor,
                  width: 1,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
            filled: true,
            fillColor: textForm,
            prefixIcon: Icon(
              prefixIcon,
              color: secondaryColor,
              size: 20,
            ),
            suffixIcon: IconButton(
              onPressed: onTapSuffixIcon,
              icon: Icon(suffixIcon),
              color: secondaryColor,
              iconSize: 20,
            )),
      ),
    );

Widget divide(String title) => Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: Color(0xffE0E0E0),
          ),
        ),
        Text(
          '  $title  ',
          style: TextStyle(color: secondaryColor, fontSize: 14, fontWeight: FontWeight.w400),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: Color(0xffE0E0E0),
          ),
        ),
      ],
    );

Widget customIconButton(
        {required VoidCallback onTap, required IconData icon, double iconSize = 28}) =>
    IconButton(
        iconSize: iconSize,
        padding: EdgeInsets.all(0),
        constraints: BoxConstraints(
          minWidth: 54,
          minHeight: 54,
        ),
        style: ButtonStyle(
            iconColor: WidgetStatePropertyAll(primaryColor),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: secondaryColor, width: 1)),
            )),
        onPressed: onTap,
        icon: Icon(
          icon,
        ));

Widget customMainText({required String data}) => Text(
      data,
      style: TextStyle(fontSize: 48, fontWeight: FontWeight.w700, color: primaryColor),
    );
Widget backIconButton({
  required context,
}) =>
    IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.chevron_left,
          size: 24,
          color: primaryColor,
        ));

Widget carouselSliderRemote({required HomeModel model}) => Stack(
      children: [
        CarouselSlider(
          items: model.data!.banners!
              .map((element) => Image(
                    image: NetworkImage(element.image.toString()),
                    fit: BoxFit.cover,
                  ))
              .toList(),
          options: CarouselOptions(
            autoPlay: true,
            height: double.infinity,
            autoPlayAnimationDuration: Duration(seconds: 1),
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayInterval: Duration(seconds: 3),
            viewportFraction: 1.0,
            reverse: false,
            initialPage: 0,
            enableInfiniteScroll: true,
          ),
        ),
      ],
    );

CarouselSliderController controller = CarouselSliderController();

Widget carousalSliderLocal(
        {required List<Map<String, dynamic>> list,
        required dynamic Function(int, CarouselPageChangedReason)? onPageChanged,
        required int currentIndex}) =>
    CarouselSlider(
      carouselController: controller,
      items: list
          .map((element) => Stack(
                children: [
                  Image(
                    image: AssetImage(element['image']),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
                    width: 230,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          element['title'],
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          element['subTitle'],
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
                        AnimatedSmoothIndicator(
                          activeIndex: currentIndex,
                          count: bannersContent.length,
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
      options: CarouselOptions(
        onPageChanged: onPageChanged,
        autoPlay: true,
        height: double.infinity,
        autoPlayAnimationDuration: Duration(seconds: 1),
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayInterval: Duration(seconds: 3),
        viewportFraction: 1.0,
        reverse: false,
        initialPage: 0,
        enableInfiniteScroll: true,
      ),
    );

Widget customProductsIcon(
        {required VoidCallback function, required IconData icon, required String title}) =>
    Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 20, 20),
      child: Column(
        children: [
          IconButton(
            onPressed: function,
            icon: Icon(
              icon,
              size: 24,
              color: primaryColor,
            ),
            padding: EdgeInsets.all(15),
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(textForm),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );

Widget customProduct(Products model) => Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Image(
                    image: NetworkImage(model.image!),
                    width: double.infinity,
                    height: 180,
                    // fit: BoxFit.cover,
                  ),
                ),
                if (model.discount != 0)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage('assets/images/discount.png'),
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                model.name.toString(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
              child: Row(
                children: [
                  Text(
                    '\$ ${model.price!.round()} ',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.5,
                    ),
                  ),
                  if (model.discount != 0)
                    Expanded(
                      child: Text(
                        '\$${model.oldPrice!.round()}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: secondaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  Spacer(),
                  IconButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border),
                    color: secondaryColor,
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
