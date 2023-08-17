import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant/View/component/widgets.dart';

import '../../Model/doctor.dart';

class AdminWidget extends StatelessWidget {
  Information? doctorinfo;
  AdminWidget({required this.doctorinfo, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          // Colors.black45,
          Color.fromARGB(255, 49, 108, 163),
          Color.fromARGB(255, 95, 153, 252),
          // Colors.orange,
        ], begin: Alignment.centerLeft, end: Alignment.centerRight),
      ),
      padding: EdgeInsets.all(12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: Color.fromARGB(227, 66, 163, 158)),
            child: ListTile(
              title: Text(
                doctorinfo?.name ?? 'name',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25.sp),
              ),
              subtitle: Text(
                doctorinfo?.address ?? 'address',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              trailing: Icon(
                Icons.delete,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  width: 200.w,
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: Color.fromARGB(226, 139, 238, 9)),
                  child: Text(
                    doctorinfo?.type ?? 'type',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              sbox(w: 5.w),
              Expanded(
                child: Container(
                  width: 200.w,
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: Color.fromARGB(228, 10, 243, 231)),
                  child: Text(
                    doctorinfo?.title ?? 'title',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
