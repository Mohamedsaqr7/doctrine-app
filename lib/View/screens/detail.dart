import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resturant/View/auth/signup.dart';
import 'package:resturant/View/screens/payment.dart';

import '../../ViewModel/bloc/home/homecubit.dart';
import '../../ViewModel/bloc/home/hometate.dart';
import '../../ViewModel/services/navigation.dart';
import '../component/widgets.dart';

class Details extends StatelessWidget {

  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: HomeCubit.get(context)..getdoctorById(),
        child: Scaffold(
            backgroundColor: color1,
            body: BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                var cubit = HomeCubit.get(context);

                return Column(
                  children: [
                    sbox(h: 80),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )),
                        Spacer(),
                        text1(text: 'Details', color: Colors.white, size: 25),
                        Spacer(),
                        Icon(
                          Icons.more_vert_sharp,
                          color: Colors.white,
                        ),
                        sbox(w: 20)
                      ],
                    ),
                    sbox(h: 35.h),
                    SizedBox(
                      width: 320,
                      height: 90,
                      child: Card(
                        color: Color.fromARGB(240, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(
                            color: Color.fromARGB(255, 189, 186, 186),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12.0.w),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 68, 202, 255),
                                child: FaIcon(
                                  FontAwesomeIcons.userNurse,
                                  size: 40,
                                  color: Colors.black,
                                ),
                                radius: 40,
                              ),
                              sbox(w: 10),
                              Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    text1(
                                        text:cubit.information?.name ??'Dr. Mim Akhtar',
                                        color: black,
                                        weight: FontWeight.bold,
                                        size: 25),
                                    text1(
                                        text:cubit.information?.address ??'apholo hospital',
                                        color: Colors.black,
                                        size: 20),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: color1,
                          borderRadius: BorderRadius.circular(20.r)),
                    ),
                    Container(
                      color: Colors.white,
                      height: 482,
                      child: Padding(
                        padding: EdgeInsets.all(15.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sbox(h: 35.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                container2(
                                  text0: 'patients',
                                  text2: '100+',
                                  color: color2,
                                ),
                                sbox(w: 10),
                                container2(
                                  text0: 'Exp.',
                                  text2: '10 yr',
                                  color: color2,
                                ),
                                sbox(w: 10),
                                container2(
                                  text0: 'Rating',
                                  text2: '4.5',
                                  color: color2,
                                ),
                                sbox(w: 10),
                              ],
                            ),
                            sbox(h: 20),
                            text1(
                                text: 'About',
                                color: black,
                                size: 25,
                                weight: FontWeight.bold),
                            sbox(h: 10),
                            Text(
                              cubit.information?.title??'dadasddsadadaddasdasdata\nssssssssssss\nsss',
                              maxLines: 3,
                              style: TextStyle(color: black, fontSize: 18.sp),
                              textAlign: TextAlign.start,
                            ),
                            sbox(h: 20.h),
                            SizedBox(
                              height: 80,
                              width: 350,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: const BorderSide(
                                    color: Color(0xffE2E2E2),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.clock,
                                        color: color1,
                                        size: 30,
                                      ),
                                      sbox(w: 15),
                                      Center(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            text1(
                                                text: 'Availability',
                                                color: black,
                                                size: 18),
                                            sbox(h: 3.h),
                                            text1(
                                                text: '6 PM - 9 PM',
                                                weight: FontWeight.bold,
                                                color: black,
                                                size: 20),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Icon(Icons.arrow_forward_ios_sharp)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            sbox(h: 30.h),
                            InkWell(
                              onTap: () =>
                                  Navigation.gopush(context, Payment()),
                              child: button(
                                  w: 350.w,
                                  color: black,
                                  fontcolor: Colors.white,
                                  text: 'Book Now',
                                  f: 20),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            )));
  }
}
