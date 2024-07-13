import 'package:flutter/material.dart';
import 'package:recsan/const.dart';
import 'package:recsan/constance.dart';
import 'package:translator/translator.dart';

class ingredientsView extends StatefulWidget {
  ingredientsView({super.key, required this.ingredients});
  late String ingredients;

  @override
  State<ingredientsView> createState() => _ingredientsViewState();
}

class _ingredientsViewState extends State<ingredientsView> {
    double add=45;
  double sub=25;
 double value=17;


TextDirection textDirection=TextDirection.ltr;
bool istransaate=true;
  @override
  Widget build(BuildContext context) {
    widget.ingredients = widget.ingredients.replaceAll("&lt", "");
    return Container(
        height: double.infinity,
        width: double.infinity,
        color: kPrimary,
        child:  Column(
            children: [
              SizedBox(
                height: AppConstants.height50(context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if(sub==15){
                            value++;
                            add++;
                            sub=15;


                          }
                          else{
                            value++;
                            add++;
                            sub--;
                            print(sub);
                          }


                        });
                      },
                      icon:  Icon(
                        Icons.add,
                        color: Colors.white,
                        size: add,
                      )),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if(add==20){
                            value--;
                            sub++;
                            add=20;
                          }
                          else{
                            value--;
                            sub++;
                            add-=2;

                          }


                        });
                      },
                      icon:  Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: sub,
                      )),
                ],
              ),
             Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                 height: AppConstants.height550(context),
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: AppConstants.width15(context),
                          vertical: AppConstants.height15(context)),
                      decoration: BoxDecoration(
                          color: Color(0xffA3C7C1),
                          borderRadius: BorderRadius.circular(20)),
                      child: SingleChildScrollView(
                        child: Column(

                          children: [

                             Directionality(
                              textDirection: textDirection,
                               child:
                               Text(

                                 widget.ingredients,
                                style:  TextStyle(
                                    color: Colors.white,
                                    fontSize: value,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500),),
                             ),
                            SizedBox(
                              height: AppConstants.height30(context),
                            ),
                            Container(
                              height: AppConstants.height50(context),
                              width: AppConstants.width200(context),
                              decoration: const BoxDecoration(color: Color(0xff4E7D74)),
                              child: MaterialButton(
                                onPressed: () async {
                                  final transaltor = GoogleTranslator(
                                  client: ClientType.extensionGT);
                                  final transaltion   =istransaate? await
                              transaltor.translate(
           widget.ingredients,
                                      from: 'en',
                                      to: 'ar'):

                                  await
                                  transaltor.translate(
                                     widget.ingredients,

                                      from: 'ar',
                                      to: 'en');
                                  setState(() {
                                  widget.ingredients = transaltion.text;
                                    if(istransaate==false)  textDirection=TextDirection.ltr;
                                  if(istransaate==true)  textDirection=TextDirection.rtl;
                                    istransaate=!istransaate;


                                  });

                                },
                                child: const Text(
                                  'Translate',
                                  style: TextStyle(
                                    color: Color(0xffFDB623),
                                    fontSize: 20,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xffFDB623),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),


              SizedBox(
                height: AppConstants.height30(context),
              )
            ],
          ),


    );
  }
}
