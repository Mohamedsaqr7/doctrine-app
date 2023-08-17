import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../ViewModel/services/navigation.dart';

Widget button({
  required Color color,
  required Color fontcolor,
  required String text,
  double? w,
  double? h,
  double? f,
}) =>
    Container(
      width: w ?? 170.w,
      height: h ?? 60.h,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(20.r)),
      child: Center(
        child: Text(
          '$text',
          style: TextStyle(fontSize: f ?? 30.sp, color: fontcolor),
        ),
      ),
    );
Widget Textfield({
  required TextEditingController controller,
  String? errormessage,
  required String label,
  required TextInputType type,
  required IconData prefix,
  IconButton? suffix,
  required FormFieldValidator validate,
  bool ispassword = false,
}) =>
    TextFormField(
      validator: validate,
      showCursor: true,
      keyboardType: type,
      obscureText: ispassword,
      cursorColor: Color.fromARGB(255, 5, 110, 196),
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          prefixIcon: Icon(prefix),
          prefixIconColor: Color.fromARGB(255, 5, 110, 196),
          label: Text(label,
              style: TextStyle(color: Color.fromARGB(255, 5, 110, 196))),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: BorderSide(color: Color.fromARGB(255, 226, 16, 16))),
          suffixIcon: suffix,
          suffixIconColor: Color.fromARGB(255, 5, 110, 196)),
      controller: controller,
    );
Widget text1({
  required String text,
  FontWeight? weight,
  required Color color,
  double? size,
}) =>
    Text(
      '$text',
      style: TextStyle(color: color, fontSize: size, fontWeight: weight),
    );
Widget text2({
  required String text,
  required Color color,
  double? size,
}) =>
    Text(
      '$text',
      textAlign: TextAlign.center,
      style: TextStyle(color: color, fontSize: 32, fontWeight: FontWeight.bold),
    );

Widget sbox({double? h, double? w}) => SizedBox(
      height: h,
      width: w,
    );

Color color1 = Color.fromARGB(255, 5, 110, 196);
Color color2 = Color.fromARGB(181, 231, 226, 226);

Color black = Colors.black;
toast({
  required String message,
  required Color bcolor,
  required Color tcolor,
 required ToastGravity gravity,
}) =>
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity,
      backgroundColor: bcolor,
      textColor: tcolor,
      fontSize: 25.sp,
    );
Widget container1({
  required Color color,
  FaIcon? icon,
}) =>
    Container(
      child: Center(child: icon),
      width: 72.w,
      height: 72.h,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
    );
Widget container2({
  required Color color,
  FaIcon? icon,
  required String text0,
  required String text2,
}) =>
    SizedBox(
        width: 72.w,
        height: 72.h,
        child: Card(
          color: Color.fromARGB(255, 228, 226, 226),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(
              color: Color.fromARGB(255, 189, 186, 186),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text1(text: text0, color: black),
                sbox(h: 5),
                text1(
                    text: text2,
                    color: Colors.black,
                    size: 20,
                    weight: FontWeight.bold)
              ],
            ),
          ),
        ));

Widget con3({
  required Icon icon,
  required String text,
  String? text2,
}) =>
    Container(
      width: 350.w,
      height: 50.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r), color: Colors.white),
      child: ListTile(
        leading: icon,
        title: text1(
            text: text, size: 20.sp, weight: FontWeight.bold, color: black),
      ),
    );
Widget con4({
  required Icon icon,
  required String text,
  required String text2,
}) =>
    SizedBox(
      width: 350.w,
      height: 80.h,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(
            color: Color(0xffE2E2E2),
          ),
        ),
        // width: 350.w,
        // height: 80.h,
        // decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(20.r),
        //     color: Color.fromARGB(255, 243, 241, 241)),
        child: Center(
          child: ListTile(
            leading: icon,
            title: text1(
                text: text, size: 20.sp, weight: FontWeight.bold, color: black),
            subtitle: text1(text: text2, color: Colors.grey, size: 15.sp),
          ),
        ),
      ),
    );
