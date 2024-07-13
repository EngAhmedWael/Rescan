import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  const Custombutton({
    super.key,
    required this.text,
    required this.onPressed
  });
final String text;
 final void Function()?onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.height*0.3,
      height: 50,
      decoration:const BoxDecoration(color: Color(0xff547F77),borderRadius: BorderRadius.all(Radius.circular(8))),
      child: MaterialButton(onPressed: onPressed,
        child: Text(text,style:const TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize:25,fontFamily: "Roboto"),),
      ),
    );
  }
}