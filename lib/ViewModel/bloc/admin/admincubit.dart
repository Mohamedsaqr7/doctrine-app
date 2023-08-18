import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Model/doctor.dart';
import '../../services/network/diohelper.dart';
import '../../services/network/endpoints.dart';
import '../loccal/sharedpref/shared.dart';
import '../loccal/sharedpref/sharedkeys.dart';
import 'adminstate.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit() : super(AdminInitState());
  static AdminCubit get(context) => BlocProvider.of<AdminCubit>(context);
  var key1 = GlobalKey<FormState>();

  var title2 = TextEditingController();
  var name2 = TextEditingController();
  var address = TextEditingController();
  var type = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
 int currenttaskindex1 = 0;
  void changecurrentindex1(int index) {
    currenttaskindex1 = index;
  }

  DoctorModel? doctormodel;
  Information? information;

  void Getdoctors() {
    emit(GetAllLoadingState());
    DioHelper.get(
      endpoint: Endpoint.GetDoctor,
              token: SharedPreference.get(SharedKeys.token),

    ).then((value) {
      doctormodel = DoctorModel.fromJson(value.data);
      emit(GetAllSuccessState());
    }).catchError((onError) {
      emit(GetAllErrorState());
    });
  }
  void AddDoctor() async {
    emit(AdminloadingState());
    await DioHelper.post(
        endpoint: Endpoint.AddDoctor,
        token: SharedPreference.get(SharedKeys.token),
        data: {
          'name': name2.text,
          'email': email.text,
          'password': password.text,
          'title': title2.text,
          'address': address.text,
          'type': type.text,
        }).then((value) {
      if (value.data['code'] == 200 && value.data['code'] == 201) {
        information = Information.fromJson(value.data);
        if (information != null) {
          doctormodel?.informations?.add(information!);
        }
        print(value.data);
        emit(AdminsuccessState());
      } 
      
    }).catchError((onError) {
      emit(AdminerrorState());
    });
  }

   void Update() {
    emit(updateloadingState());
    DioHelper.post(
        endpoint:
        '$Endpoint.UpdateDoctor/${doctormodel?.informations?[currenttaskindex1].id}',
        token: SharedPreference.get(SharedKeys.token),
        queryparams: {
          '_method': 'put'
        },
        data: {
         'name': name2.text,
          'email': email.text,
          'password': password.text,
          'title': title2.text,
          'address': address.text,
          'type': type.text,
        }).then((value) {
      print(value.data);

      information = Information.fromJson(value.data['response']);
      if (information != null) {
        doctormodel?.informations?[currenttaskindex1] = information!;
      }
      print(value.data);
      emit(updatsuccesseState());
    }).catchError((onError) {
      emit(updateerrorState());
    });
  }

  void Delete() {
    emit(deleteloadingState());
    DioHelper.delete(
      endpoint:
          '$Endpoint.DeleteDoctor/${doctormodel?.informations?[currenttaskindex1].id}',
      token: SharedPreference.get(SharedKeys.token),
    ).then((value) {
      print(value.data);

      doctormodel?.informations?.removeAt(currenttaskindex1);

      print(value.data);
      emit(deletesuccessState());
    }).catchError((onError) {
      emit(deleteerrorState());
    });
  }

}
