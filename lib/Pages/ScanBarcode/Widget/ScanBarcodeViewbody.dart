import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:recsan/Pages/Product/product.dart';
import 'package:recsan/const.dart';
import 'package:recsan/constance.dart';

class ScanViewbody extends StatefulWidget {
  const ScanViewbody({super.key});

  @override
  State<ScanViewbody> createState() => _ScanViewbodyState();
}

class _ScanViewbodyState extends State<ScanViewbody> {
 String? BarcodeResult;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: double.infinity,
      width: double.infinity,
      color: kPrimary,
      child:  Column(
          crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: AppConstants.height40(context),),
         Padding(
           padding: const EdgeInsets.all(18.0),
           child:  IconButton( onPressed:(){
             showDialog(
                 context: context,
                 builder: (BuildContext context) {
                   return const AlertDialog(
                     title: Text("Message"),
                     content: Text('Click on the image to open a camera to capture the barcode'),
                   );
                 });
           },icon:Icon(Icons.settings,color: Colors.black,size: 30,),
         ),),

          Stack(
              clipBehavior: Clip.none,
              children:[
            GestureDetector(
            onTap: (){
              scanQr();
            }
            , child: Align(alignment: Alignment.center,child: Image(image:const AssetImage("assets/Images/Image.png"),
                  height: AppConstants.height500(context),)),
            ),


             Positioned(
                  bottom: -AppConstants.height80(context),
                  right: AppConstants.width200(context),
                  left: AppConstants.width200(context),
                  child:   Container(
                      alignment: Alignment.center,
                      height: AppConstants.height90(context),

                      decoration: BoxDecoration(

                        boxShadow:const [
                          BoxShadow(
                            color: Color(0xffFDB623), //Color of the shadow

                            blurRadius:8,
                            //Offset of the shadow
                          ),
                        ] ,
                          color:const Color(0xff547F77),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: GestureDetector(onTap: (){
                        scanQr();
                      },child: Image(image: AssetImage("assets/Images/barcode.png"),height:AppConstants.height55(context),)),
                    ),
                  ),



          ])

        ],
        ),

    );
  }

  Future<void> scanQr() async {
    try {
      FlutterBarcodeScanner.scanBarcode('#2A99CF', 'cancel', true, ScanMode.QR)
          .then((value) {
        setState(() {
          BarcodeResult = value;
        });

        Navigator.push(context, MaterialPageRoute(builder: (context) => Product(
          barcode: BarcodeResult!,
        ),));
      });
    } catch (e) {
      setState(() {
        BarcodeResult = 'unable to read this';
      });
    }
  }
}
