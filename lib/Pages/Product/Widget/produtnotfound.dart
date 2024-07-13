import 'dart:math';

import 'package:flutter/material.dart';
import 'package:recsan/Pages/Login.dart/Widget/custombutton.dart';
import 'package:recsan/const.dart';
import 'package:recsan/constance.dart';

class notFound extends StatefulWidget {
  const notFound({super.key});

  @override
  State<notFound> createState() => _notFoundState();
}

class _notFoundState extends State<notFound> {
  double x=0;

  double y=0;

  double amplitude=0.3;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        color: kPrimary,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: AppConstants.height55(context),
            ),
            Align(
              alignment: Alignment.center,
              child:
              Transform(
                  alignment: FractionalOffset.center,
                  transform: Matrix4.identity()..rotateX(x)..rotateY(y),
                  child: GestureDetector(
                      onPanUpdate: (details) {
                        if (y - details.delta.dx < 0) {
                          setState(() {
                            y = max(y - details.delta.dx / 100, -amplitude);
                          });
                        }
                        else {
                          setState(() {
                            y = min(y - details.delta.dx / 100, amplitude);
                          });
                        }
                        if (x + details.delta.dy < 0) {
                          setState(() {
                            x = max(x +details.delta.dy / 100, -amplitude);
                          });
                        }
                        else {
                          setState(() {
                            x = min(x + details.delta.dy / 100, amplitude);
                            //y
                          });
                        }
                      },
                     child: Image(
                  image: const AssetImage("assets/Images/ImageProduct.png"),
                  height: AppConstants.height500(context),

                )))),
            const Text(
              'We apologize for the lack of data for this product',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: AppConstants.height20(context),
            ),
            Custombutton(
              onPressed: () {
                Navigator.pushNamed(context, 'Scan');
              },
              text: 'Back to page',
            )
          ]),
        ));
  }
}
