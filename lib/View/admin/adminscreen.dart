import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:resturant/View/admin/adddocc.dart';
import 'package:resturant/View/component/adminwidget.dart';
import 'package:resturant/ViewModel/bloc/admin/admincubit.dart';
import 'package:resturant/ViewModel/bloc/admin/adminstate.dart';

import '../../ViewModel/services/navigation.dart';
import '../Doctor/adddpatient.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: AdminCubit.get(context)..Getdoctors(),
        child:Scaffold(
      body: BlocConsumer<AdminCubit, AdminState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = AdminCubit.get(context);

          return (cubit.doctormodel?.informations ?? []).isEmpty
              ? Center(
                  child: Column(
                    children: [
                      Lottie.network(
                          'https://assets8.lottiefiles.com/packages/lf20_z4cshyhf.json',
                          height: 400.h,
                          width: 350.w),
                      // SizedBox(height: 20.h,),
                      Text(
                        'ADD TASK...!',
                        style: TextStyle(fontSize: 25.sp),
                      )
                    ],
                  ),
                )
              : Padding(
                  padding: EdgeInsets.all(12.w),
                  child: ListView.separated(
                      physics: BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemBuilder: (context, index) {
                        return Material(
                            borderRadius: BorderRadius.circular(15.r),
                            color: Color.fromARGB(255, 234, 239, 241),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: InkWell(
                                onTap: () {
                                  // cubit.changecurrentindex(index);
                                  Navigation.gopush(context, AddDoctor());
                                },
                                child: AdminWidget(
                                  doctorinfo:
                                      cubit.doctormodel?.informations?[index],
                                )));
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            height: 10.h,
                          ),
                      itemCount: cubit.doctormodel?.informations?.length ?? 0),
                );
          ;
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigation.gopush(context, Addpatient());
          },
          child: Icon(Icons.add)),
    ));
  }
}
