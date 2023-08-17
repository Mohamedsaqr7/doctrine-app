import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant/View/component/widgets.dart';

import '../../ViewModel/bloc/home/homecubit.dart';
import '../../ViewModel/bloc/home/hometate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: HomeCubit.get(context),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = HomeCubit.get(context);
            return Scaffold(
              body: SafeArea(
                child: cubit.layouts[cubit.currentindex],
              ),
              bottomNavigationBar: BottomNavigationBar(
                
                onTap: (index) => cubit.changecurrentindex(index),
                currentIndex: cubit.currentindex,
                selectedItemColor: color1,
                unselectedItemColor: Color.fromARGB(255, 5, 66, 116),
                selectedLabelStyle: TextStyle(
                  color: color1,
                ),
                unselectedLabelStyle: TextStyle(
                  color: Color.fromARGB(255, 5, 66, 116),
                ),
                showUnselectedLabels: true,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_filled,
                    ),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.receipt_long,
                    ),
                    label: "Report",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.notifications,
                    ),
                    label: "Notifications",
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
