import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant/View/component/widgets.dart';

import '../component/home/homewidget.dart';

class Notificate extends StatelessWidget {
  const Notificate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.all(15.0.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sbox(h: 30.h),
          text1(
              text: 'Notifications',
              color: black,
              weight: FontWeight.bold,
              size: 25.sp),
          sbox(h: 15.h),
          con4(
              icon: Icon(
                Icons.table_rows_outlined,
                color: Colors.blue,
                size: 40,
              ),
              text: '3 schedules!',
              text2: 'check your schedules today'),
          sbox(h: 20.h),
          con4(
              icon: Icon(
                Icons.message,
                color: Color.fromARGB(255, 243, 33, 79),
                size: 40,
              ),
              text: '14 Messages',
              text2: 'check your schedules today'),
          sbox(h: 20.h),
          con4(
              icon: Icon(
                Icons.medication_liquid_rounded,
                color: Color.fromARGB(255, 236, 186, 21),
                size: 40,
              ),
              text: ' Medicine',
              text2: 'check your schedules today'),
          sbox(h: 20.h),
          con4(
              icon: Icon(
                Icons.vaccines,
                color: Color.fromARGB(255, 33, 184, 243),
                size: 40,
              ),
              text: 'Vaccine Update',
              text2: 'check your schedules today'),
          sbox(h: 20.h),
          con4(
              icon: Icon(
                Icons.update,
                color: Color.fromARGB(255, 165, 46, 46),
                size: 40,
              ),
              text: 'App Update',
              text2: 'check your schedules today'),
          sbox(h: 20.h),
        ],
      ),
    )));
  }
}
