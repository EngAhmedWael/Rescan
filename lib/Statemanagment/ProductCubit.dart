

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


part 'ProductState.dart';

class Productcubit extends Cubit<ProductState> {
  Productcubit() : super(ProductInitial());

  final dio = Dio();

  var product ;

  void getHttp({required String barcode}) async {
    EasyLoading.show(status: "please wait...");
    emit(Load());

    try {
      final response = await dio.get(
          'https://world.openfoodfacts.org/api/v0/product/$barcode.json');



      product = await  response.data ;

      EasyLoading.dismiss();
      emit(Succ());
    }  catch (e) {
      EasyLoading.dismiss();
      emit(Err(err: e.toString()));
    }
  }
}
