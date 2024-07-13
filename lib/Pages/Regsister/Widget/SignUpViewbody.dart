
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recsan/Models/UserModel.dart';
import 'package:recsan/Pages/Login.dart/Widget/TextFormField.dart';
import 'package:recsan/Pages/Login.dart/Widget/custombutton.dart';
import 'package:recsan/Statemanagment/CubitSignup.dart';
import 'package:recsan/Statemanagment/StateSignup.dart';
import 'package:recsan/const.dart';
import 'package:recsan/constance.dart';

class Signupviewbody extends StatefulWidget {
  const Signupviewbody({super.key});

  @override
  State<Signupviewbody> createState() => _SignupviewbodyState();
}

class _SignupviewbodyState extends State<Signupviewbody> {
  TextEditingController email = TextEditingController();
  TextEditingController UserName = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
int steps=0;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigUpCubit,SigupState>(builder: (context, state) {
      return Container(
          height: double.infinity,
          width: double.infinity,
          color: kPrimary,

          child: SingleChildScrollView(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: formKey,
                  autovalidateMode:autovalidateMode ,
                  child:
                      Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(

                                children: [
                                  SizedBox(
                                    height: AppConstants.height40(context),
                                  ),
                                  const Text(
                                    "Sign up",
                                    style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "DM Serif Display"),
                                  ),
                                  SizedBox(
                                    height: AppConstants.height40(context),
                                  ),
                                  AddressTextForm(context,text: "Full Name"),
                                  SizedBox(
                                    height: AppConstants.height8(context),
                                  ),
                                    TextFormAcc(
                                      obsure: false,
                                    text: "Full Name",
                                    onchanged: (value) {
                                      UserName.text = value;
                                    },
                                  ),
                                  SizedBox(
                                    height: AppConstants.height30(context),
                                  ),
                                  AddressTextForm(context,text: "Email"),
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
                                    height: AppConstants.height30(context),
                                  ),
                                  AddressTextForm(context,text: "Password"),
                                  SizedBox(
                                    height: AppConstants.height8(context),
                                  ),
                                   TextFormAcc(
                                     obsure: false,
                                    onchanged: (value) {
                                      password.text = value;
                                    },
                                    text: "*******************",

                                  ),
                                  SizedBox(
                                    height: AppConstants.height40(context),
                                  ),
                                  Custombutton(
                                    text: "Sign up",
                                    onPressed: (){
                                      if(formKey.currentState!.validate()) {

                                        BlocProvider.of<SigUpCubit>(context).Regsister(
                                            email: email.text, password: password.text);

                                      }
                                      else{
                                        autovalidateMode = AutovalidateMode.always;
                                        setState(() {
                                          steps=1;
                                        });


                                      }
                                    },
                                  ),


                                ] ),
                          )),

                      if(steps==0)      SizedBox(height: AppConstants.height30(context),),
                         if(steps==0)   Image(
                        image:
                        AssetImage("assets/Images/Layer 1.png"),
                        height:
                        AppConstants.height400(context),alignment: Alignment.centerLeft,)
                      else if(steps==1)   Image(
                      image:
                      AssetImage("assets/Images/Layer 1.png"),
                      height:
                      AppConstants.height300(context),alignment: Alignment.centerLeft,)
                    ],
                  ),
                ),


      );
    }, listener:(context, state) {
      if (state is LoadingState) {}
      if (state is SuccessState) {
        UserModel userModel = UserModel(
          uId: FirebaseAuth.instance.currentUser!.uid,
          username: UserName.text,
          email: email.text,
        );

        FirebaseFirestore.instance
            .collection('Users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set(userModel.toMap());
        FirebaseAuth.instance.currentUser!.sendEmailVerification();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                'A new account has been created. Please go to the email and activate the account')));
        Navigator.pushReplacementNamed(context, '/');
      }
        else if (state is FailureState) {
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
      child:  Align(
        alignment: Alignment.topLeft,
        child: Text(
          text,
          style:const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 15,
              fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}


