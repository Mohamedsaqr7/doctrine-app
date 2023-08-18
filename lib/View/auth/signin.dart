import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:resturant/View/auth/signup.dart';
import 'package:resturant/ViewModel/services/navigation.dart';

import '../../ViewModel/bloc/Login/logcubit.dart';
import '../../ViewModel/bloc/Login/logstate.dart';
import '../component/widgets.dart';
import 'onboarding.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LogCubit, LogState>(
        listener: (context, state) {
          if (state is logsuccessstate) {
            Navigation.gopush(context, OnBoarding());
          } else if (state is logerrorstate) {
            toast(
                message: 'error',
                bcolor: Colors.red,
                tcolor: Colors.white,
                gravity: ToastGravity.BOTTOM);
          }
        },
        builder: (context, state) {
          var cubit = LogCubit.get(context);

          return Padding(
            padding: EdgeInsets.all(12.0.w),
            child: SafeArea(
                child: SingleChildScrollView(
              child: Form(
                key: cubit.formkey,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      text1(text: 'Email', color: Colors.black, size: 20.sp),
                      Textfield(
                          validate: (value) {
                            if (value!.trim().isEmpty) return 'enter email';
                            return null;
                          },
                          label: 'Email',
                          prefix: Icons.email,
                          controller: cubit.email,
                          errormessage: 'enter email',
                          type: TextInputType.emailAddress),
                      SizedBox(
                        height: 30.h,
                      ),
                      text1(text: 'Password', color: Colors.black, size: 20.sp),
                      SizedBox(
                        height: 30.h,
                      ),
                      Textfield(
                          validate: (value) {
                            if (value!.trim().isEmpty) return 'enter password';
                            return null;
                          },
                          label: 'password',
                          prefix: Icons.password,
                          controller: cubit.password,
                          errormessage: 'invalid password',
                          type: TextInputType.emailAddress,
                          ispassword: true,
                          suffix: IconButton(
                            onPressed: () {
                              cubit.showpass();
                            },
                            icon: Icon(cubit.obscure
                                ? Icons.visibility
                                : Icons.visibility_off),
                            color: Colors.blue,
                          )),
                      SizedBox(
                        height: 30.h,
                      ),
                      InkWell(
                        onTap: () {
                          if (cubit.formkey.currentState!.validate()) {
                            cubit.Login();
                            //Navigation.gopushreplace(context, OnBoarding());
                            print('welcome');
                          }
                          return null;
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 350.w,
                          height: 70.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blueAccent,
                          ),
                          child: 
                          state is logloadingstate?
                              text1(
                                  text: 'LogIn', color: Colors.white, size: 35):
                                  CircularProgressIndicator.adaptive(
                                  backgroundColor: Colors.red,
                                )
                              
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          text1(
                              text: 'Don\'t have an account?',
                              color: Colors.black,
                              size: 18),
                          SizedBox(
                            width: 5.w,
                          ),
                          InkWell(
                              onTap: () => Navigation.gopush(context, SignUp()),
                              child: text1(
                                  text: 'Register Now',
                                  color: Colors.blueAccent)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )),
          );
        },
      ),
    );
  }
}
