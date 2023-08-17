import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant/View/Layouts/not.dart';
import 'package:resturant/ViewModel/bloc/home/hometate.dart';

import '../../../View/Layouts/home.dart';
import '../../../View/Layouts/report.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitState());
    static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);
  List<Widget> layouts = [Home(), Report(), Notificate()];

  int currentindex = 0;
  void changecurrentindex(index) {
    currentindex = index;
    emit(changeindex());
  }


}
