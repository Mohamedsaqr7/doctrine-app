import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant/View/Layouts/not.dart';
import 'package:resturant/ViewModel/bloc/admin/adminstate.dart';
import 'package:resturant/ViewModel/bloc/home/hometate.dart';
import 'package:resturant/ViewModel/services/network/diohelper.dart';
import 'package:resturant/ViewModel/services/network/endpoints.dart';

import '../../../Model/doctor.dart';
import '../../../View/Layouts/home.dart';
import '../../../View/Layouts/report.dart';
import '../loccal/sharedpref/sharedkeys.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitState());
  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);
  List<Widget> layouts = [Home(), Report(), Notificate()];
  var formky = GlobalKey<FormState>();

  int currentindex = 0;
  void changecurrentindex(index) {
    currentindex = index;
    emit(changeindex());
  }
  TextEditingController search = TextEditingController();

  DoctorModel? doctormodel;

  void Getalldoctors() {
    emit(GetAlldoctorsLoadingState());
    DioHelper.get(
      endpoint: Endpoint.GetDoctor,
    ).then((value) {
      doctormodel = DoctorModel.fromJson(value.data);
      emit(GetAlldoctorsSuccessState());
    }).catchError((onError) {
      emit(GetAlldoctorsErrorState());
    });
  }

  Information? information;
  int currenttaskindex1 = 0;
  void changecurrentindex1(int index) {
    currenttaskindex1 = index;
  }

  Future<void> getdoctorById() async {
    emit(GetProductByIDLoadingState());

    DioHelper.get(
            endpoint:
                '$Endpoint.UpdateDoctor/${doctormodel?.informations?[currenttaskindex1].id}')
        .then((value) {
      information = Information.fromJson(value.data);
      emit(GetProductByIDSuccessState());
    }).catchError((onError) {
      emit(GetProductByIDErrorState());
      print(onError);
      throw onError;
    });
  }
  void Search() {
    emit(SearchloadState());
    DioHelper.get(
      endpoint: Endpoint.GetDoctor,
      token: SharedKeys.token,
      
    ).then((value) {
      doctormodel = DoctorModel.fromJson(value.data);
      emit(SearchsuccessState());
    }).catchError((onError) {
      emit(SearcherrorState());
    });
  }
}
