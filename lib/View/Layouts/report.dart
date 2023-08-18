import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../component/widgets.dart';

class Report extends StatelessWidget {
  const Report({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15.0.w),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                text2(
                  text: 'Report',
                  color: black,
                  size: 25.sp,
                ),
                Spacer(),
                Icon(
                  Icons.more_horiz,
                  color: black,
                  size: 25,
                )
              ],
            ),
            sbox(h: 15),
            SizedBox(
              width: 350.w,
              height: 150.h,
              child: Card(
                  color: Color.fromARGB(230, 83, 168, 218),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(
                      color: Color.fromARGB(255, 15, 11, 238),
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(12.0.w),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              sbox(h: 10.h),
                              text1(text: 'Heart rate', size: 18, color: black),
                              sbox(h: 10.h),
                              Row(
                                children: [
                                  text1(
                                      text: '96',
                                      size: 70,
                                      weight: FontWeight.bold,
                                      color: black),
                                  text1(text: 'bpm', size: 18, color: black),
                                ],
                              )
                            ],
                          ),
                          sbox(w: 70.w),
                          FaIcon(
                            FontAwesomeIcons.heartPulse,
                            color: color1,
                            size: 120,
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
            sbox(h: 15.h),
            Row(
              children: [
                SizedBox(
                  width: 150.w,
                  height: 150.h,
                  child: Card(
                    color: Color.fromARGB(255, 245, 127, 142),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(
                        color: Color.fromARGB(255, 218, 59, 59),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12.0.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.bloodtype,
                              color: Color.fromARGB(255, 175, 13, 22)),
                          sbox(h: 10),
                          text1(text: 'blood group', size: 18, color: black),
                          sbox(h: 10),
                          text1(
                              text: 'A+',
                              size: 40,
                              weight: FontWeight.bold,
                              color: black),
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: 150.w,
                  height: 150.h,
                  child: Card(
                    color: Color.fromARGB(255, 245, 210, 146),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(
                        color: Color.fromARGB(242, 218, 181, 59),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12.0.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.weightScale,
                            color: Color.fromARGB(241, 235, 189, 39),
                          )
                          // Icon(Icons.weight,
                          //     color: Color.fromARGB(255, 175, 13, 22)),
                          ,
                          sbox(h: 10),
                          text1(text: 'weight', size: 18, color: black),
                          sbox(h: 10),
                          text1(
                              text: '80',
                              size: 40,
                              weight: FontWeight.bold,
                              color: black),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            sbox(h: 15.h),
            text1(text: 'lattest report', color: black),
            sbox(h: 15.h),
            con4(
                icon: Icon(
                  Icons.note,
                  color: color1,
                  size: 40,
                ),
                text: 'general health',
                text2: '8 files'),
            sbox(h: 15.h),
            con4(
                icon: Icon(
                  Icons.note,
                  color: Colors.green,
                  size: 40,
                ),
                text: 'general health',
                text2: '8 files'),
          ],
        )),
      ),
    );
  }
}
