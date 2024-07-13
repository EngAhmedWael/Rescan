
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recsan/Pages/Product/Widget/productViewbody.dart';
import 'package:recsan/Statemanagment/ProductCubit.dart';

class Product extends StatelessWidget {
  const Product({super.key,required this.barcode});
final String barcode;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Productcubit()..getHttp(barcode: barcode),
      child:  Scaffold(
        body:Productviewbody(barcodes:barcode ,) ,
      ),
    );
  }
}
