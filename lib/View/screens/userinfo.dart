import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant/View/auth/signin.dart';
import 'package:resturant/ViewModel/bloc/loccal/sharedpref/shared.dart';
import 'package:resturant/ViewModel/services/navigation.dart';

import '../component/widgets.dart';

class Userinfo extends StatelessWidget {
  const Userinfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      body: Padding(
        padding: EdgeInsets.all(12.0.w),
        child: Column(
          children: [
            sbox(h: 30.h),
            Row(
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
              ],
            ),
            sbox(h: 60.h),
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 61, 214, 241),
                    radius: 45,
                    child: Icon(
                      Icons.person_2,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  sbox(h: 10.h),
                  text1(
                      text: 'mhmd saqr',
                      color: Colors.white,
                      size: 30,
                      weight: FontWeight.bold),
                  text1(
                    text: 'programmer',
                    color: Colors.white,
                    size: 20,
                  ),
                  sbox(h: 30.h),
                  con3(
                      icon: Icon(
                        Icons.settings,
                        color: black,
                      ),
                      text: 'Account settings'),
                  sbox(h: 20.h),
                  con3(
                      icon: Icon(
                        Icons.privacy_tip_outlined,
                        color: black,
                      ),
                      text: 'Privacy Policy'),
                  sbox(h: 20.h),
                  con3(
                      icon: Icon(
                        Icons.payment,
                        color: black,
                      ),
                      text: 'Payment settings'),
                  sbox(h: 60.h),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigation.gopushreplace(context, SignIn());
                SharedPreference.clear();
              },
              child: Center(
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  title:
                      text1(text: 'Log Out', size: 20.sp, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
