import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resturant/ViewModel/services/navigation.dart';

import '../component/widgets.dart';
import 'Confirm.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(left: 30.0, right: 30),
      child: SafeArea(
        child: Column(
          children: [
            sbox(h: 20),
            Row(
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back)),
                sbox(w: 70.w),
                text1(
                    size: 22,
                    text: 'checkout',
                    color: black,
                    weight: FontWeight.bold),
              ],
            ),
            sbox(h: 50.h),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: color1,
                ),
                text1(text: '.', color: color1, size: 35),
                sbox(w: 20.w),
                text1(text: '.', color: color1, size: 35),
                sbox(w: 20.w),
                text1(text: '.', color: color1, size: 35),
                sbox(w: 20.w),
                text1(text: '.', color: color1, size: 35),
                sbox(w: 20.w),
                Icon(
                  Icons.payment,
                  color: color1,
                ),
                sbox(w: 20.w),
                text1(text: '.', color: black, size: 35),
                sbox(w: 20.w),
                text1(text: '.', color: black, size: 35),
                sbox(w: 20.w),
                text1(text: '.', color: black, size: 35),
                sbox(w: 20.w),
                Icon(
                  Icons.done_all,
                  color: black,
                ),
              ],
            ),
            sbox(h: 40.h),
            Image.asset('images/pay.png'),
            sbox(h: 40.h),
            InkWell(
              onTap: () => Navigation.gopush(context, Confirm()),
              child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            // Colors.black45,
                            Color.fromARGB(255, 129, 201, 243),
                            Color.fromARGB(255, 10, 53, 94),
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
                  width: 350,
                  height: 80,
                  child: Image.asset('images/paypal.png')),
            ),
          ],
        ),
      ),
    ));
  }
}
