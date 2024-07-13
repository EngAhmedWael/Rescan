

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:recsan/Pages/Get%20Started/Get%20Started.dart';
import 'package:recsan/Pages/Login.dart/Login.dart';
import 'package:recsan/Pages/Regsister/SignUp.dart';
import 'package:recsan/Pages/ScanBarcode/ScanBarcode.dart';
import 'package:recsan/Statemanagment/CubitSigin.dart';
import 'package:recsan/Statemanagment/CubitSignup.dart';
import 'package:recsan/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SigInCubit(),
        ),
        BlocProvider(
          create: (context) => SigUpCubit(),
        )
      ],
      child: MaterialApp(
builder: EasyLoading.init(),
        initialRoute: "/",
        routes: {
          "/": (context) =>const Login(),
          "SignUp": (context) =>const SignUp(),
          "Scan": (context) =>const Scan(),
          "GetStarted": (context) =>const GetStarted()
        },

        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
