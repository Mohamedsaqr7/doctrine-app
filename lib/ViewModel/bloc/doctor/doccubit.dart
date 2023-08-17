import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant/ViewModel/bloc/loccal/sharedpref/shared.dart';
import 'package:resturant/ViewModel/bloc/loccal/sharedpref/sharedkeys.dart';

import '../../../Model/patientmodel.dart';
import '../../../Model/patientmodel.dart';
import '../../../Model/patientmodel.dart';
import '../../services/network/diohelper.dart';
import '../../services/network/endpoints.dart';
import 'docstate.dart';

class Doccubit extends Cubit<Docstate> {
  Doccubit() : super(Docinitstate());
  static Doccubit get(context) => BlocProvider.of<Doccubit>(context);
  var keyy1 = GlobalKey<FormState>();
  var name = TextEditingController();
  var date_of_birth = TextEditingController();
  var diagnosis = TextEditingController();
  var address = TextEditingController();
  var visit_time = TextEditingController();
  void Initcontroller() {
    name.text = docpatient?.patinfo?[currenttaskindex1].name ?? '';
    date_of_birth.text =
        docpatient?.patinfo?[currenttaskindex1].date_of_birth ?? '';
    diagnosis.text = docpatient?.patinfo?[currenttaskindex1].diagnosis ?? '';
    address.text = docpatient?.patinfo?[currenttaskindex1].address ?? '';
    visit_time.text = docpatient?.patinfo?[currenttaskindex1].visit_time ?? '';
  }

  int currenttaskindex1 = 0;
  void changecurrentindex1(int index) {
    currenttaskindex1 = index;
  }

  Docpatient? docpatient;
  PatientInformation? patientinformation;

  void AddPatient() async {
    emit(Docloadingtstate());
    await DioHelper.post(
        endpoint: Endpoint.Addpatient,
        token: SharedPreference.get(SharedKeys.token),
        data: {
          'name': name.text,
          'date_of_birth': date_of_birth.text,
          'diagnosis': diagnosis.text,
          'address': address.text,
          'visit_time': visit_time.text,
        }).then((value) {
      print(value.data);
      patientinformation = PatientInformation.fromJson(value.data['response']);
      if (patientinformation != null) {
        docpatient?.patinfo?.add(patientinformation!);
      }
      print(value.data);
      emit(Docsuccesststate());
    }).catchError((onError) {
      emit(Docerrorstate());
    });
  }

  void Update() {
    emit(Docupdateloadstate());
    DioHelper.post(
        endpoint:
            '$Endpoint.Updatepatient/${docpatient?.patinfo?[currenttaskindex1].id}',
        token: SharedPreference.get(SharedKeys.token),
        queryparams: {
          '_method': 'put'
        },
        data: {
          'name': name.text,
          'date_of_birth': date_of_birth.text,
          'diagnosis': diagnosis.text,
          'address': address.text,
          'visit_time': visit_time.text,
        }).then((value) {
      print(value.data);

      patientinformation = PatientInformation.fromJson(value.data['response']);
      if (patientinformation != null) {
        docpatient?.patinfo?[currenttaskindex1] = patientinformation!;
      }
      print(value.data);
      emit(Doceupdatesuccstate());
    }).catchError((onError) {
      emit(Docupdateerrorstate());
    });
  }

  void Delete() {
    emit(Deleteloadingtstate());
    DioHelper.delete(
      endpoint:
          '$Endpoint.Deletepatient/${docpatient?.patinfo?[currenttaskindex1].id}',
      token: SharedPreference.get(SharedKeys.token),
    ).then((value) {
      print(value.data);

      docpatient?.patinfo?.removeAt(currenttaskindex1);

      print(value.data);
      emit(Deletesuccesststate());
    }).catchError((onError) {
      emit(Deleteerrorstate());
    });
  }
}
