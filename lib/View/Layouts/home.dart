import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resturant/View/component/widgets.dart';
import 'package:resturant/View/screens/detail.dart';
import 'package:resturant/ViewModel/bloc/loccal/sharedpref/shared.dart';
import 'package:resturant/ViewModel/bloc/loccal/sharedpref/sharedkeys.dart';

import '../../ViewModel/bloc/home/homecubit.dart';
import '../../ViewModel/bloc/home/hometate.dart';
import '../../ViewModel/services/navigation.dart';
import '../component/doctorwidget.dart';
import '../component/home/homewidget.dart';
import '../screens/userinfo.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {},
              builder: (context, state) {
                var cubit = HomeCubit.get(context);
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 12.0.w,
                      top: 20.h,
                      right: 12.w,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Row(
                              children: [
                                Icon(
                                  Icons.waving_hand_sharp,
                                  color: Colors.yellow,
                                ),
                                text1(text: 'Hello!', color: black),
                                sbox(h: 5),
                                text1(
                                    text:
                                        'mr ${SharedPreference.get(SharedKeys.Username)}' ??
                                            '',
                                    color: black,
                                    size: 25),
                              ],
                            ),
                            trailing: InkWell(
                              onTap: () {
                                Navigation.gopush(context, Userinfo());
                              },
                              child: CircleAvatar(
                                backgroundColor: color1,
                                child: Icon(Icons.person),
                              ),
                            ),
                          ),
                          sbox(h: 20.h),
                          Center(
                            child: Container(
                              height: 45.h,
                              width: 320.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Color.fromARGB(193, 181, 231, 225),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(12.0.w),
                                child: Row(
                                  children: [
                                    Icon(Icons.search,
                                        color:
                                            Color.fromARGB(255, 145, 141, 141)),
                                    sbox(w: 5.w),
                                    text1(
                                        text: 'Search',
                                        color:
                                            Color.fromARGB(255, 145, 141, 141)),
                                    Spacer(),
                                    Icon(
                                      Icons.format_list_bulleted_rounded,
                                      color: Color.fromARGB(255, 145, 141, 141),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          sbox(h: 20.h),
                          text1(text: 'Services', color: black, size: 18.sp),
                          sbox(h: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              container1(
                                icon: FaIcon(
                                  FontAwesomeIcons.userNurse,
                                  color: Color.fromARGB(255, 3, 54, 95),
                                ),
                                color: Color.fromARGB(255, 50, 166, 212),
                              ),
                              sbox(w: 10),
                              container1(
                                  icon: FaIcon(
                                    FontAwesomeIcons.bandage,
                                    color: Colors.yellowAccent,
                                  ),
                                  color: Color.fromARGB(255, 221, 185, 170)),
                              sbox(w: 10),
                              container1(
                                  icon: FaIcon(
                                    FontAwesomeIcons.commentMedical,
                                    color: Color.fromARGB(255, 0, 108, 151),
                                  ),
                                  color: Color.fromARGB(255, 112, 174, 199)),
                              sbox(w: 10),
                              container1(
                                  icon: FaIcon(
                                    FontAwesomeIcons.virusCovid,
                                    color: Color.fromARGB(255, 180, 68, 60),
                                  ),
                                  // image: 'images/flfl.png',
                                  color: Color.fromARGB(255, 223, 167, 167)),
                              sbox(w: 10),
                            ],
                          ),
                          sbox(h: 20.h),
                          Container(
                            //width: 400,
                            //height: 500,
                            child: ListView.separated(
                                physics: BouncingScrollPhysics(
                                    parent: BouncingScrollPhysics()),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Material(
                                      elevation: 0,
                                      borderRadius: BorderRadius.circular(15.r),
                                      color: Color.fromARGB(255, 234, 239, 241),
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: InkWell(
                                          onTap: () {
                                            Navigation.gopush(
                                                context, Details());
                                          },
                                          child: HomeWidget(doctorinfo: cubit.doctormodel?.informations?[index],)));
                                },
                                separatorBuilder: (context, index) =>
                                    sbox(h: 5),
                                itemCount: cubit.doctormodel?.informations?.length ?? 0),
                          )
                        ]),
                  ),
                );
              }),
        );
  }
}
