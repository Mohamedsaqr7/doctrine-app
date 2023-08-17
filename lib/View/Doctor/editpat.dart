import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant/ViewModel/bloc/admin/adminstate.dart';

import '../../ViewModel/bloc/doctor/doccubit.dart';
import '../../ViewModel/bloc/doctor/docstate.dart';
import '../component/widgets.dart';

class EditPatient extends StatelessWidget {
  const EditPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<Doccubit, Docstate>(
      listener: (context, state) {
        if (state is Doceupdatesuccstate||state is deletesuccessState) {
          Navigator.pop(context);
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = Doccubit.get(context);
        return Padding(
          padding: EdgeInsets.all(12.0.w),
          child: Stack(
            children: [
              Positioned(
                bottom: 0.h,
                top: 15.h,
                right: 0.w,
                left: 0.w,
                child: SingleChildScrollView(
                  child: Container(
                    height: 650.h,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              // Colors.black45,
                              Color.fromARGB(255, 49, 108, 163),
                              Color.fromARGB(255, 95, 153, 252),
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
                    child: Form(
                      key: cubit.keyy1,
                      child: SingleChildScrollView(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30.h,
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 25.sp,
                              )),
                          Padding(
                            padding: EdgeInsets.all(12.0.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Edit or Delete',
                                  style: TextStyle(
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      letterSpacing: 4),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  ' Patient info.',
                                  style: TextStyle(
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      letterSpacing: 2),
                                ),
                                SizedBox(height: 25.h),
                                sbox(h: 15.h),
                                Textfield(
                                  controller: cubit.visit_time,
                                  label: 'patirnt name',
                                  type: TextInputType.name,
                                  prefix: Icons.person,
                                  validate: (value) {
                                    if (value!.trim().isEmpty)
                                      return 'enter your name';
                                    return null;
                                  },
                                ),
                                sbox(h: 20.h),
                                Textfield(
                                  controller: cubit.diagnosis,
                                  label: 'description',
                                  type: TextInputType.text,
                                  prefix: Icons.description,
                                  validate: (value) {
                                    if (value!.trim().isEmpty)
                                      return 'enter description';
                                    return null;
                                  },
                                ),
                                sbox(h: 20.h),
                                Textfield(
                                  controller: cubit.address,
                                  label: 'pat. address',
                                  type: TextInputType.text,
                                  prefix: Icons.home_outlined,
                                  validate: (value) {
                                    if (value!.trim().isEmpty)
                                      return 'enter address';
                                  },
                                ),
                                sbox(h: 20.h),
                                TextFormField(
                                  cursorColor: Color.fromARGB(255, 18, 4, 139),
                                  controller: cubit.visit_time,
                                  keyboardType: TextInputType.none,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                  ),
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                      ),
                                      prefixIcon:
                                          Icon(Icons.access_time_rounded),
                                      prefixIconColor:
                                          Color.fromARGB(255, 5, 110, 196),
                                      label: Text('date',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 5, 110, 196))),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 226, 16, 16))),
                                      suffixIconColor:
                                          Color.fromARGB(255, 5, 110, 196)),
                                  onTap: (() {
                                    showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2020),
                                            lastDate: DateTime(2024))
                                        .then((value) => cubit.visit_time.text =
                                            value?.toString() ?? '');
                                  }),
                                ),
                                sbox(h: 20.h),
                                TextFormField(
                                  cursorColor: Color.fromARGB(255, 18, 4, 139),
                                  controller: cubit.visit_time,
                                  keyboardType: TextInputType.none,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                  ),
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                      ),
                                      prefixIcon:
                                          Icon(Icons.access_time_rounded),
                                      prefixIconColor:
                                          Color.fromARGB(255, 5, 110, 196),
                                      label: Text('date of birth',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 5, 110, 196))),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 226, 16, 16))),
                                      suffixIconColor:
                                          Color.fromARGB(255, 5, 110, 196)),
                                  onTap: (() {
                                    showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2020),
                                            lastDate: DateTime(2024))
                                        .then((value) => cubit.date_of_birth
                                            .text = value?.toString() ?? '');
                                  }),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 8.0.w, right: 8.w),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            if (cubit.keyy1.currentState!
                                                .validate())
                                              cubit.Update();
                                          },
                                          child: Container(
                                            height: 60.h,
                                            width: 80.w,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(30),
                                                  bottomRight:
                                                      Radius.circular(30),
                                                  topLeft: Radius.circular(30),
                                                  topRight: Radius.circular(30),
                                                )),
                                            child: Center(
                                                child: Text(
                                              'EDIT',
                                              style: TextStyle(
                                                  fontSize: 25.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: color1),
                                            )),
                                          ),
                                        ),
                                      ),
                                      sbox(w: 5.w),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            if (cubit.keyy1.currentState!
                                                .validate()) 
                                                cubit.Delete();
                                          },
                                          child: Container(
                                            height: 60.h,
                                            width: 80.w,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(30),
                                                  bottomRight:
                                                      Radius.circular(30),
                                                  topLeft: Radius.circular(30),
                                                  topRight: Radius.circular(30),
                                                )),
                                            child: Center(
                                                child: Text(
                                              'DELETE',
                                              style: TextStyle(
                                                  fontSize: 25.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: color1),
                                            )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ));
    ;
  }
}
