import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant/ViewModel/bloc/Login/logstate.dart';
import 'package:resturant/ViewModel/services/network/diohelper.dart';
import 'package:resturant/ViewModel/services/network/endpoints.dart';

import '../../../Model/person.dart';
import '../loccal/sharedpref/shared.dart';
import '../loccal/sharedpref/sharedkeys.dart';

class LogCubit extends Cubit<LogState> {
  LogCubit() : super(LogInitState());
  static LogCubit get(context) => BlocProvider.of<LogCubit>(context);
  var formkey = GlobalKey<FormState>();
  bool obscure = true;

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();
  void showpass() {
    obscure = !obscure;
    emit(showpassstate());
  }

  Information? infor;
  PersonModel? personmodel;

  void Login() async {
    emit(logloadingstate());
    DioHelper.post(
        endpoint: Endpoint.Login,
        data: {'email': email.text, 'password': password.text}).then(
      (value) {
        print(value.data);
        if (value.data['code'] == 200 || value.data['code'] == 201) {
          // SharedPreference.set(SharedKeys.token, personmodel?.token);
          if (infor != null) {
            CashUserData(infor!);
            SharedPreference.set(SharedKeys.IsLogin, true);
          }
          infor = Information.fromJson(value.data);
          emit(logsuccessstate());
        }
      },
    ).catchError((onError) {
      emit(logerrorstate());
    });
  }

  void CashUserData(Information info) {
    SharedPreference.set(SharedKeys.Userid, infor?.id);
    SharedPreference.set(SharedKeys.Username, infor?.name);
    SharedPreference.set(SharedKeys.token, personmodel?.token);
  }
}
