import 'package:flutter/material.dart';
import 'package:shoping_application/shared/network/style/colors.dart';

class UploadImageWidget extends StatelessWidget {
  const UploadImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/upload_image.gif'),
              fit: BoxFit.cover,
            ),
            shape: BoxShape.circle,
            border: Border.all(color: primaryColor, width: .1),
          ),
        ),
        IconButton(
          onPressed: () {},
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.white)),
          icon: Icon(
            Icons.image,
            color: secondaryColor,
          ),
        ),
      ],
    );
  }
}
