import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant/View/Layouts/report.dart';
import 'package:resturant/View/screens/detail.dart';
import 'package:resturant/ViewModel/bloc/SignUp/signcubit.dart';
import 'package:resturant/ViewModel/bloc/admin/admincubit.dart';
import 'package:resturant/ViewModel/bloc/doctor/doccubit.dart';
import 'package:resturant/ViewModel/bloc/home/homecubit.dart';
import 'package:resturant/ViewModel/bloc/loccal/sharedpref/shared.dart';
import 'package:resturant/ViewModel/services/network/endpoints.dart';
import 'View/Doctor/Doctorscreen.dart';
import 'View/Doctor/Dverifi.dart';
import 'View/Doctor/adddpatient.dart';
import 'View/Doctor/editpat.dart';
import 'View/Layouts/home.dart';
import 'View/Layouts/not.dart';
import 'View/admin/Verification.dart';
import 'View/admin/adddocc.dart';
import 'View/admin/adminscreen.dart';
import 'View/admin/editdoc.dart';
import 'View/auth/signin.dart';
import 'View/auth/onboarding.dart';
import 'View/auth/signup.dart';
import 'View/component/home/homewidget.dart';
import 'View/screens/Confirm.dart';
import 'View/screens/homescreen.dart';
import 'View/screens/payment.dart';
import 'View/screens/search.dart';
import 'View/screens/userinfo.dart';
import 'ViewModel/bloc/Login/logcubit.dart';
import 'ViewModel/bloc/blocobserver/observer.dart';
import 'ViewModel/bloc/loccal/sharedpref/sharedkeys.dart';
import 'ViewModel/services/network/diohelper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.initState();
  await SharedPreference.initShared();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

//sheko for example
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LogCubit()..Login()),
          BlocProvider(create: (context) => SignCubit()..register()),
          BlocProvider(
              create: (context) => Doccubit()
                ..AddPatient()
                ..Update()
                ..Delete()),
          BlocProvider(
              create: (context) => AdminCubit()
                ..AddDoctor()
                ..Update()
                ..Delete()),
          BlocProvider(create: (context) => HomeCubit()),
        ],
        child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (BuildContext context, Widget? child) {
            return MaterialApp(
                debugShowCheckedModeBanner: false, home: 
                (SharedPreference.get(SharedKeys.IsLogin)??false)?HomeScreen():SignIn(),
                );
          },
        ));
  }
}
