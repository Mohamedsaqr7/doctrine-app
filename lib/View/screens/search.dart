import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../ViewModel/bloc/home/homecubit.dart';
import '../../ViewModel/bloc/home/hometate.dart';
import '../component/adminwidget.dart';
import '../component/widgets.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: HomeCubit.get(context)..Search(),
        child: Scaffold(
            body: BlocProvider.value(
                value: HomeCubit.get(context),
                child: BlocConsumer<HomeCubit, HomeState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      var cubit = HomeCubit.get(context);
                      return Scaffold(
                          body: SafeArea(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 12.0.w, top: 20.h, right: 12.w),
                          child: Form(
                            key: cubit.formky,
                            child: Column(
                              children: [
                                Textfield(
                                  controller: cubit.search,
                                  label: 'Search',
                                  type: TextInputType.text,
                                  prefix: Icons.search,
                                  validate: (value) {
                                    if (value!.trim().isEmpty)
                                      return 'enter text to search';
                                    return null;
                                  },
                                ),
                                sbox(h: 20),
                                Center(
                                  child:
                                  state is SearchloadState?
                              LinearProgressIndicator():Expanded(
                                child: ListView.separated(
                                    physics: BouncingScrollPhysics(
                                        parent: AlwaysScrollableScrollPhysics()),
                                    itemBuilder: (context, index) {
                                      return  AdminWidget(
                                                doctorinfo:
                                                    cubit.doctormodel?.informations?[index],
                                              );
                                    },
                                    separatorBuilder: (context, index) => SizedBox(
                                          height: 10.h,
                                        ),
                                    itemCount: cubit.doctormodel?.informations?.length ?? 0),
                              ))
                              ],
                            ),
                          ),
                        ),
                      ));
                    }))));
  }
}
