import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recsan/Pages/ScanBarcode/ScanBarcode.dart';
import 'package:recsan/constance.dart';

class GetStartbody extends StatelessWidget {
  const GetStartbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xff6A8B85),
            Color(0xff405450),
            Color(0xff1C2524),
          ],
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: AppConstants.height55(context),
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.65,
            height: AppConstants.height60(context),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  " RE",
                  style: TextStyle(
                      color: Color(0xff345A53),
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "scan",
                  style: TextStyle(
                      color: Color(0xff6A8B85),
                      fontSize: 35,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          SizedBox(
            height: AppConstants.height20(context),
          ),
          Image(
            image: const AssetImage("assets/Images/barcode.png"),
            height: AppConstants.height50(context),
          ),
          SizedBox(
            height: AppConstants.height10(context),
          ),
          const Padding(
            padding: const EdgeInsets.only(left: 20, right: 80),
            child: Text(
              "Easily scan and read small text on product packaging with our app",
              style: TextStyle(
                  fontFamily: "Poppins",
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 17),
            ),
          ),
          SizedBox(
            height: AppConstants.height55(context),
          ),
          const Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage("assets/Images/Mask Group.png")),
                CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/Images/bar.png")),
              ],
            ),
          ),
          Container(
            height: AppConstants.height450(context),
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Color(0xff6A8B85),
                borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(25),
                    topEnd: Radius.circular(25))),
            child: Column(
              children: [
                const Text(
                  "Get Started",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                SizedBox(
                  height: AppConstants.height8(context),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: AppConstants.width80(context),
                      right: AppConstants.width80(context)),
                  child: const Text(
                    "Go and enjoy our features for free and make your life easy with us.",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: AppConstants.height20(context),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Scan(),
                        ));
                  },
                  child: Container(
                      height: AppConstants.height40(context),
                      width: AppConstants.width200(context),
                      decoration: const BoxDecoration(
                        color: Color(0xff547F77),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff333333), //Color of the shadow

                            blurRadius: 8,
                            //Offset of the shadow
                          )
                        ],
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            'Let’s Go',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 13),
                          ),
                          Icon(
                            Icons.arrow_forward_outlined,
                          ),
                        ],
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
