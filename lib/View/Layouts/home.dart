import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resturant/View/component/widgets.dart';
import 'package:resturant/View/screens/detail.dart';

import '../../ViewModel/bloc/home/homecubit.dart';
import '../../ViewModel/bloc/home/hometate.dart';
import '../../ViewModel/services/navigation.dart';
import '../component/doctorwidget.dart';
import '../component/home/homewidget.dart';
class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeCubit, HomeState>(listener: (context, state) {
      }, builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                      physics: BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemBuilder: (context, index) {
                        return Material(
                          borderRadius: BorderRadius.circular(20.r),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: InkWell(
                              onTap: () {},
                              child: Column(
                                children: [
                                  HomeWidget(),
                                ],
                              )),
                        );
                      },
                      separatorBuilder: (context, index) => sbox(h: 5),
                      itemCount: 5),
                )
              ],
            ),
          )),
        );
      }),
    );
  }
}


                // ListTile(
                //   title: Row(
                //     children: [
                //       Icon(
                //         Icons.waving_hand_sharp,
                //         color: Colors.yellow,
                //       ),
                //       text1(text: 'Hello!', color: black),
                //     ],
                //   ),
                //   subtitle: text2(
                //     text: 'mr. mhmd',
                //     color: black,
                //   ),
                //   trailing: CircleAvatar(
                //     backgroundColor: color1,
                //   ),
                // ),
                // sbox(h: 20.h),
                // Center(
                //   child: Container(
                //     height: 45.h,
                //     width: 320.w,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10.r),
                //       color: Color.fromARGB(193, 181, 231, 225),
                //     ),
                //     child: Padding(
                //       padding: EdgeInsets.all(12.0.w),
                //       child: Row(
                //         children: [
                //           Icon(Icons.search,
                //               color: Color.fromARGB(255, 145, 141, 141)),
                //           sbox(w: 5.w),
                //           text1(
                //               text: 'Search',
                //               color: Color.fromARGB(255, 145, 141, 141)),
                //           Spacer(),
                //           Icon(
                //             Icons.format_list_bulleted_rounded,
                //             color: Color.fromARGB(255, 145, 141, 141),
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // sbox(h: 20.h),
                // text1(text: 'Services', color: black, size: 18.sp),
                // sbox(h: 20.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     container1(
                //       icon: FaIcon(
                //         FontAwesomeIcons.userNurse,
                //         color: Color.fromARGB(255, 3, 54, 95),
                //       ),
                //       color: Color.fromARGB(255, 50, 166, 212),
                //     ),
                //     sbox(w: 10),
                //     container1(
                //         icon: FaIcon(
                //           FontAwesomeIcons.bandage,
                //           color: Colors.yellowAccent,
                //         ),
                //         color: Color.fromARGB(255, 221, 185, 170)),
                //     sbox(w: 10),
                //     container1(
                //         icon: FaIcon(
                //           FontAwesomeIcons.commentMedical,
                //           color: Color.fromARGB(255, 0, 108, 151),
                //         ),
                //         color: Color.fromARGB(255, 112, 174, 199)),
                //     sbox(w: 10),
                //     container1(
                //         icon: FaIcon(
                //           FontAwesomeIcons.virusCovid,
                //           color: Color.fromARGB(255, 180, 68, 60),
                //         ),
                //         // image: 'images/flfl.png',
                //         color: Color.fromARGB(255, 223, 167, 167)),
                //     sbox(w: 10),
                //   ],
                // ),
                //sbox(h: 20.h),
               
                      
                // Container(
                //   child: ListView.separated(
                //               physics: BouncingScrollPhysics(
                //                   parent: AlwaysScrollableScrollPhysics()),
                //               itemBuilder: (context, index) {
                //                 return Material(
                //                    borderRadius: BorderRadius.circular(15.r),
                //         color: Color.fromARGB(255, 234, 239, 241),
                //         clipBehavior: Clip.antiAliasWithSaveLayer,
                //                   child: InkWell(
                //                       onTap: () {
                //                         // cubit.changecurrentindex1(index);
                //                         // Navigatioon.gopush(context, EddTask());
                //                       },
                //                       child: Column(
                //                         children: [
                                          
                //                          HomeWidget()
                //                         ],
                //                       )),
                //                 );
                //               },
                //               separatorBuilder: (context, index) => SizedBox(
                //                     height: 10.w,
                //                   ),
                //               itemCount: 5),
                // ),
