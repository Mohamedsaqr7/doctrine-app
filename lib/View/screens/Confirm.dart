import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant/View/Layouts/home.dart';
import 'package:resturant/View/component/widgets.dart';

import '../../ViewModel/services/navigation.dart';

class Confirm extends StatelessWidget {
  const Confirm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12.0.w),
            child: Column(
              children: [
                sbox(h: 20.h),
                Row(
                  children: [
                    sbox(h: 20),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )),
                        sbox(w: 70.w),
                        text1(
                            size: 22,
                            text: 'checkout',
                            color: Colors.white,
                            weight: FontWeight.bold),
                      ],
                    ),
                  ],
                ),
                sbox(h: 100.h),
                text1(
                    text: 'Thanks!',
                    color: Colors.white,
                    size: 40,
                    weight: FontWeight.bold),
              ],
            ),
          ),
          sbox(h: 80.h),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(100))),
            height: 379.h,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundColor: color1,
                    radius: 50,
                    child: Icon(Icons.done, color: Colors.white, size: 100),
                  ),
                  sbox(h: 20.h),
                  text1(
                      size: 25.sp,
                      text: 'We wish you good health.',
                      color: color1),
                  sbox(h: 40.h),
                  InkWell(
                    onTap: () => Navigation.gopush(context, Home()),
                    child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  // Colors.black45,
                                  Color.fromARGB(255, 87, 181, 243),
                                  Color.fromARGB(255, 31, 255, 244),
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
                        width: 320,
                        height: 70,
                        child: Center(
                            child: text1(
                                text: 'continue',
                                color: Colors.white,
                                size: 35))),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
