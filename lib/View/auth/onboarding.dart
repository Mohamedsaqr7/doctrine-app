import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant/View/auth/signup.dart';
import 'package:resturant/View/component/widgets.dart';
import 'package:resturant/View/screens/homescreen.dart';

import '../../ViewModel/services/navigation.dart';
import '../Doctor/Dverifi.dart';
import '../admin/Verification.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              bottom: 50.h,
              top: 50.h,
              right: 15.w,
              left: 15.w,
              child: Container(
                height: 500.h,
                width: 350,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      // Colors.black45,
                      Color.fromARGB(255, 49, 108, 163),
                      Color.fromARGB(255, 95, 153, 252),
                      // Colors.orange,
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //InkWell(onTap: () => Navigation.gopush(context,AdminVerif() ),),
                    Text(
                      'Welcome to Doctrine App\nAre you',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    sbox(h: 20.h),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () => Navigation.gopush(context, AdminVerif()),
                          child: button(
                            color: Colors.blue,
                            text: 'Admin',
                            fontcolor: Colors.white,
                          ),
                        ),
                        sbox(h: 20.h),
                        Text(
                          'OR',
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.sp),
                        ),
                        sbox(h: 20.h),
                        InkWell(
                          onTap: () =>
                              Navigation.gopush(context, DoctorVerif()),
                          child: button(
                              color: Color.fromARGB(255, 219, 2, 2),
                              text: 'Doctor',
                              fontcolor: Colors.white),
                        ),
                        sbox(h: 20.h),
                        Text(
                          'OR',
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.sp),
                        ),
                        sbox(h: 20.h),
                        InkWell(
                          onTap: () {
                            Navigation.gopush(context, HomeScreen());
                          },
                          child: button(
                              color: Color.fromARGB(255, 41, 231, 3),
                              text: 'Patient',
                              fontcolor: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
