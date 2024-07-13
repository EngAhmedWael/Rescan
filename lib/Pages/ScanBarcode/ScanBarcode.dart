import 'package:flutter/material.dart';
import 'package:recsan/Pages/ScanBarcode/Widget/ScanBarcodeViewbody.dart';

class Scan extends StatelessWidget {
  const Scan({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ScanViewbody(),
    );
  }
}
