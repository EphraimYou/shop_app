import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Image.asset(
            'assets/images/edit_card.png',
            width: double.infinity,
            height: 230,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(55, 10, 15, 0),
              child: Row(
                children: [
                  Text(
                    'BANK NAME',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                  Spacer(),
                  Image.asset(
                    'assets/images/Frame_(6).png',
                    height: 50,
                    width: 50,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(27, 62, 0, 0),
              child: Row(
                children: [
                  Text(
                    '4532  3100  9999  1048',
                    style: TextStyle(
                      color: Color(0XFFFDFDFD),
                      fontSize: 25,
                      fontWeight: FontWeight.w100,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 95),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 37),
                    child: Text(
                      'Month/years',
                      style: TextStyle(
                        color: Color(0XFFFDFDFD),
                        fontSize: 8,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'EXPIRES\n \t\t\t DATA :',
                        style: TextStyle(
                          color: Color(0XFFFDFDFD),
                          fontSize: 8,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '00:00',
                        style: TextStyle(
                          color: Color(0XFFFDFDFD),
                          fontSize: 15,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(25, 7, 0, 0),
              child: Row(
                children: [
                  Text(
                    'EPHRAIM YOUSSEF',
                    style: TextStyle(
                      color: Color(0XFFFDFDFD),
                      fontSize: 18,
                      fontWeight: FontWeight.w200,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
