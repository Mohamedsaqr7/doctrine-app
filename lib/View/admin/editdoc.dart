import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../ViewModel/bloc/admin/admincubit.dart';
import '../../ViewModel/bloc/admin/adminstate.dart';
import '../component/widgets.dart';

class EditDoctor extends StatelessWidget {
  const EditDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AdminCubit, AdminState>(
        listener: (context, state) {
          if (state is updatsuccesseState||state is deletesuccessState) {
          Navigator.pop(context);
        }
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = AdminCubit.get(context);
          return Padding(
            padding: EdgeInsets.only(left: 12.0.w, right: 12.w),
            child: Stack(
              children: [
                Positioned(
                  bottom: 10.h,
                  top: 180.h,
                  right: 0.w,
                  left: 0.w,
                  child: SingleChildScrollView(
                    child: Container(
                      height: 500.h,
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
                        key: cubit.key1,
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
                                    ' Doctor',
                                    style: TextStyle(
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        letterSpacing: 2),
                                  ),
                                  SizedBox(height: 25.h),
                                  sbox(h: 15.h),
                                  Textfield(
                                    controller: cubit.title2,
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
                                    controller: cubit.address,
                                    label: 'address',
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
                                    controller: cubit.type,
                                    label: ' type',
                                    type: TextInputType.text,
                                    prefix: Icons.home_outlined,
                                    validate: (value) {
                                      if (value!.trim().isEmpty)
                                        return 'enter type';
                                    },
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.w, right: 10.w),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              if (cubit.key1.currentState!
                                                  .validate()) 
                                                  cubit.Update();
                                            },
                                            child: Container(
                                              height: 60.h,
                                              width: 80.w,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(30),
                                                    bottomRight:
                                                        Radius.circular(30),
                                                    topLeft:
                                                        Radius.circular(30),
                                                    topRight:
                                                        Radius.circular(30),
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
                                              if (cubit.key1.currentState!
                                                  .validate()) 
                                                  cubit.Delete();
                                            },
                                            child: Container(
                                              height: 60.h,
                                              width: 80.w,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(30),
                                                    bottomRight:
                                                        Radius.circular(30),
                                                    topLeft:
                                                        Radius.circular(30),
                                                    topRight:
                                                        Radius.circular(30),
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
      ),
    );
    ;
  }
}
