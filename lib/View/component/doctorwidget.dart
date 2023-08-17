import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant/View/component/widgets.dart';

import '../../Model/patientmodel.dart';

class Doctorwidget extends StatelessWidget {
  PatientInformation? patientInformation;
   Doctorwidget({ required this.patientInformation, super.key});

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
          ListTile(
            title: Text(
              patientInformation?.name??'title',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 25.sp),
            ),
            subtitle: Text(
              patientInformation?.diagnosis??'diagnosis',
              style: TextStyle(
                fontSize: 20.sp,
                color: Color.fromARGB(255, 20, 18, 18),
              ),
            ),
            trailing: Icon(
              Icons.delete,
              color: Color.fromARGB(255, 255, 255, 255),
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
                      color: Color.fromARGB(228, 10, 243, 231)),
                  child: Text(
                   patientInformation?.address?? 'address',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: Color.fromARGB(255, 189, 234, 240)),
                  child: Text(
                    patientInformation?.visit_time??'date',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
          sbox(h: 10.h),
          Center(
            child: Container(
              width: 300.w,
              height: 50,
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: Color.fromARGB(255, 189, 234, 240)),
              child: Text(
                patientInformation?.date_of_birth??'date',
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
    );
  }
}
