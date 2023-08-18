import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant/ViewModel/bloc/loccal/sharedpref/shared.dart';
import 'package:resturant/ViewModel/services/network/endpoints.dart';
import '../../../Model/person.dart';
import '../../services/network/diohelper.dart';
import '../loccal/sharedpref/sharedkeys.dart';
import 'signstate.dart';

class SignCubit extends Cubit<SignState> {
  SignCubit() : super(SignInitState());
  static SignCubit get(context) => BlocProvider.of<SignCubit>(context);
  bool obscure1 = true;
  bool obscure2 = true;
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController address = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController password1 = TextEditingController();

  var formkey1 = GlobalKey<FormState>();
  void showpass1() {
    obscure1 = !obscure1;
    emit(showpass1state());
  }

  void showpass2() {
    obscure2 = !obscure2;
    emit(showpass1state());
  }
//  void register  () async {
//     emit(signsloadingtate());
//     DioHelper.post(endpoint: Endpoint.Regester,data: {
//       // "name": username.text,
//       "email": email.text,
//       "password": password.text

//     }

//     ).then((value) {

//       print("Done");
//       emit(
//         signssuccesstate(),
//       );
//     }).catchError((onError) {
//       emit(signerrorstate());
//     });
//   }
Information? infor;
  PersonModel? personmodel;
    void register() async {
    emit(signsloadingtate());

    await DioHelper.post(
        endpoint: Endpoint.Regester,
        data: {
          "name": username.text,
          "email": email.text,
          "address": address.text,
          "title": title.text,
          "password": password.text,
        }).then((value) {
      if (value.data['code'] == 200 || value.data['code'] == 201) {
          SharedPreference.set(SharedKeys.token, personmodel?.token);

        infor = Information.fromJson(value.data);
        emit(signssuccesstate());
                  SharedPreference.set(SharedKeys.IsLogin, true);

        }
      // }).catchError((onError) {
      //   if (onError is DioException) {
      //     print(onError.response?.data);
      //         onError.response?.data['message'].toString() ?? '0'));
      //   }
    }).catchError((onError) {
      emit(signerrorstate());
    });
  }
}
