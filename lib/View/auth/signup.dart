import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant/View/component/widgets.dart';

import '../../ViewModel/bloc/SignUp/signcubit.dart';
import '../../ViewModel/bloc/SignUp/signstate.dart';
import '../../ViewModel/services/navigation.dart';
import 'onboarding.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<SignCubit, SignState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = SignCubit.get(context);
        return Form(
          key: cubit.formkey1,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0.w, top: 8.h, right: 8.w),
                    child: Container(
                      height: 680.h,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                // Colors.black45,
                                Color.fromARGB(255, 49, 108, 163),
                                Color.fromARGB(255, 95, 153, 252),
                                // Colors.orange,
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100),
                            topLeft: Radius.circular(100),
                            topRight: Radius.circular(100),
                          )),
                      child: Padding(
                        padding: EdgeInsets.all(12.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            text1(
                                text: 'Create Account',
                                color: Colors.white,
                                size: 28),
                            sbox(h: 20.h),
                            Textfield(
                                validate: (value) {
                                  if (value!.trim().isEmpty)
                                    return 'enter name';
                                  return null;
                                },
                                label: 'Username',
                                prefix: Icons.person,
                                controller: cubit.username,
                                errormessage: 'enter your name',
                                type: TextInputType.emailAddress),
                            sbox(h: 10.h),
                            Textfield(
                                validate: (value) {
                                  if (value!.trim().isEmpty)
                                    return 'enter email';
                                  return null;
                                },
                                label: 'Email',
                                prefix: Icons.email,
                                controller: cubit.email,
                                errormessage: 'enter email',
                                type: TextInputType.emailAddress),
                            
                            sbox(h: 10.h),
                            Textfield(
                                validate: (value) {
                                  if (value!.trim().isEmpty)
                                    return 'enter address';
                                  return null;
                                },
                                label: 'Address',
                                prefix: Icons.home,
                                controller: cubit.address,
                                errormessage: 'enter address',
                                type: TextInputType.emailAddress),
                            sbox(h: 10.h),
                            Textfield(
                                validate: (value) {
                                  if (value!.trim().isEmpty)
                                    return 'enter title';
                                  return null;
                                },
                                label: 'Title',
                                prefix: Icons.work,
                                controller: cubit.title,
                                errormessage: 'enter title',
                                type: TextInputType.emailAddress),
                            sbox(h: 10.h),
                            Textfield(
                                validate: (value) {
                                  if (value!.trim().isEmpty)
                                    return 'enter password';
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
                                    cubit.showpass1();
                                  },
                                  icon: Icon(cubit.obscure1 == true
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                )),
                            sbox(h: 10.h),
                            Textfield(
                                validate: (value) {
                                  if (value!.trim().isEmpty)
                                    return 'enter your password';
                                  else if (cubit.password.text !=
                                      cubit.password1.text)
                                    return 'not the same password';
                                  else if (cubit.password.text ==
                                      cubit.password1.text) return null;
                                },
                                label: 'confirm password',
                                prefix: Icons.password,
                                controller: cubit.password1,
                                errormessage: 'invalid password',
                                type: TextInputType.emailAddress,
                                ispassword: true,
                                suffix: IconButton(
                                  onPressed: () {
                                    cubit.showpass2();
                                  },
                                  icon: cubit.obscure2 == true
                                      ? const Icon(
                                          Icons.visibility_off,
                                        )
                                      : const Icon(
                                          Icons.visibility,
                                        ),
                                )),
                            sbox(h: 10.h),
                            InkWell(
                              onTap: () {
                                if (cubit.formkey1.currentState!.validate() ||
                                    cubit.password == cubit.password1) {
                                  Navigation.gopushreplace(
                                      context, OnBoarding());
                                cubit.register();

                                  print('welcome');
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 300.w,
                                height: 60.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: text2(
                                  text: 'SignUp',
                                  color: Color.fromARGB(255, 5, 110, 196),
                                ),
                              ),
                            ),

                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     text1(
                            //         text: 'Don\'t have an account?',
                            //         color: Colors.black,
                            //         size: 18),
                            //     SizedBox(
                            //       width: 5.w,
                            //     ),
                            //     InkWell(
                            //         //onTap: () => Navigation.gopush(context, screen),
                            //         child: text1(
                            //             text: 'Register Now',
                            //             color: Colors.blueAccent)),
                            //   ],
                            // )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ));
  }
}
