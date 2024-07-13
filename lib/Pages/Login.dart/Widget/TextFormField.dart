
import 'package:flutter/material.dart';
import 'package:recsan/constance.dart';

class TextFormAcc extends StatelessWidget {
  const TextFormAcc({
    super.key,
    required this.text,
    this.icondata,
    required this.obsure,
    required this.onchanged
  });
final String text;
final IconButton? icondata;
  final bool obsure;
 final void Function(String)? onchanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: AppConstants.width30(context)),
      child: TextFormField(

        obscureText: obsure,
onChanged: onchanged,
validator: (value){
if(value!.isEmpty){
  return 'field is Empty';
}
},
          decoration: InputDecoration(

            contentPadding: EdgeInsets.symmetric(vertical: AppConstants.height8(context),horizontal:AppConstants.width20(context), ),
            enabledBorder:const OutlineInputBorder(

                borderSide: BorderSide(color: Color(0xffB5B5B5))
            ),
            focusedBorder:const OutlineInputBorder(

                borderSide: BorderSide(color: Color(0xffB5B5B5))
            ),
            border:const OutlineInputBorder(

                borderSide: BorderSide(color: Color(0xffB5B5B5))
            ),
            suffixIcon: icondata,
            hintText: text,
            hintStyle:const TextStyle(color:Color(0xff6E6E6E,),fontSize:13
            ),
          )),
    );
  }
}
