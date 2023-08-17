import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:resturant/View/component/widgets.dart';
import 'package:resturant/ViewModel/bloc/doctor/doccubit.dart';
import 'package:resturant/ViewModel/bloc/doctor/docstate.dart';

import '../../ViewModel/services/navigation.dart';
import '../component/doctorwidget.dart';
import 'adddpatient.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
          child: SafeArea(
              child: Column(
        children: [
          ListTile(
            title: Text('asddasd'),
          )
        ],
      ))),
      body: BlocConsumer<Doccubit, Docstate>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = Doccubit.get(context);

          return 
          (cubit.docpatient?.patinfo??[]).isEmpty?
           Center(
                  child: Column(
                    children: [
                      Lottie.network(
                        'https://assets10.lottiefiles.com/packages/lf20_N6RcsC.json',
                        height: 400.h,
                        width: 350.w,
                      ),
                      // SizedBox(height: 20.h,),
                      Text(
                        'ADD TASK...!',
                        style: TextStyle(fontSize: 25.sp),
                      )
                    ],
                  ),
                )
              :
          Padding(
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
                            //cubit.changecurrentindex(index);
                            Navigation.gopush(context, Addpatient());
                          },
                          child: Doctorwidget(
                            patientInformation:
                                cubit.docpatient?.patinfo?[index],
                          )));
                },
                separatorBuilder: (context, index) => SizedBox(
                      height: 10.h,
                    ),
                itemCount: cubit.docpatient?.patinfo?.length ?? 0),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigation.gopush(context, Addpatient());
          },
          child: Icon(Icons.add)),
    );
  }
}
