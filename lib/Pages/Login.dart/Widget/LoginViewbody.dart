import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recsan/Pages/Login.dart/Widget/TextFormField.dart';
import 'package:recsan/Pages/Login.dart/Widget/custombutton.dart';
import 'package:recsan/Statemanagment/CubitSigin.dart';
import 'package:recsan/Statemanagment/StateSigin.dart';
import 'package:recsan/const.dart';
import 'package:recsan/constance.dart';

class Loginviewbody extends StatefulWidget {
  const Loginviewbody({super.key});

  @override
  State<Loginviewbody> createState() => _LoginviewbodyState();
}

class _LoginviewbodyState extends State<Loginviewbody> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool Obsure = true;
  int steps = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigInCubit, SiginState>(
      builder: (context, state) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          color: kPrimary,
          child: SingleChildScrollView(
            physics: const RangeMaintainingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      autovalidateMode: autovalidateMode,
                      child: Column(children: [
                        SizedBox(
                          height: AppConstants.height40(context),
                        ),
                        const Text(
                          "Log In",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w400,
                              fontFamily: "DM Serif Display"),
                        ),
                        SizedBox(
                          height: AppConstants.height40(context),
                        ),
                        AddressTextForm(context, text: "Email"),
                        SizedBox(
                          height: AppConstants.height8(context),
                        ),
                        TextFormAcc(
                          obsure: false,
                          text: "REscan@gmail.com",
                          onchanged: (value) {
                            email.text = value;
                          },
                        ),
                        SizedBox(
                          height: AppConstants.height55(context),
                        ),
                        AddressTextForm(context, text: "Password"),
                        SizedBox(
                          height: AppConstants.height8(context),
                        ),
                        TextFormAcc(
                          text: "*******************",
                          obsure: Obsure,
                          icondata: IconButton(
                              onPressed: () {
                                setState(() {
                                  Obsure = !Obsure;
                                });
                              },
                              icon: !Obsure
                                  ? const Icon(
                                      Icons.visibility_off,
                                      color: Colors.black,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    )),
                          onchanged: (value) {
                            password.text = value;
                          },
                        ),
                        SizedBox(
                          height: AppConstants.height55(context),
                        ),
                        Custombutton(
                          text: "Log in",
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<SigInCubit>(context).Login(
                                  email: email.text, password: password.text);
                            } else {
                              autovalidateMode = AutovalidateMode.always;
                              setState(() {
                                steps = 1;
                              });
                            }
                          },
                        ),
                        SizedBox(
                          height: AppConstants.height5(context),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Don't have an account?"),
                            MaterialButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'SignUp');
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Color(0xff345A53),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xff345A53)),
                              ),
                            )
                          ],
                        ),
                      ]),
                    )),
                if (steps == 0)
                  SizedBox(
                    height: AppConstants.height30(context),
                  ),
                if (steps == 0)
                  Image(
                    image: AssetImage("assets/Images/Layer 1.png"),
                    height: AppConstants.height400(context),
                    alignment: Alignment.centerLeft,
                  )
                else if (steps == 1)
                  Image(
                    image: AssetImage("assets/Images/Layer 1.png"),
                    height: AppConstants.height300(context),
                    alignment: Alignment.centerLeft,
                  )
              ],
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is SuccessState) {
          if (FirebaseAuth.instance.currentUser!.emailVerified) {
            Navigator.pushReplacementNamed(context, "GetStarted");
          } else {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.rightSlide,
              title: 'verification',
              desc:
                  "Please go to your email and click on the email verification link to activate your account",
            ).show();
          }
        } else if (state is FailureState) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Error',
            desc: '${state.errorMessage}',
          ).show();
        }
      },
    );
  }

  Padding AddressTextForm(BuildContext context, {required String text}) {
    return Padding(
      padding: EdgeInsets.only(left: AppConstants.width50(context)),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          text,
          style: const TextStyle(
              fontFamily: 'Roboto', fontSize: 15, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
