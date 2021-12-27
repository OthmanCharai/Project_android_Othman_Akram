import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_android_othman_akram/shared/appCubit/homeCubit.dart';
import 'package:project_android_othman_akram/shared/appStatus/homeState.dart';
import 'package:project_android_othman_akram/shared/components/components.dart';

class HomeLayout extends StatelessWidget {

  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>HomeCubit(),
      child: BlocConsumer<HomeCubit,HomeState>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=HomeCubit.get(context);
          return Scaffold(
         
          body:cubit.screens[cubit.currentIndex],
          bottomNavigationBar:BottomNavigationBar(
            items: [
              defaultBottomNavigationBarItem(icon: Icons.home, text: "Home"),
              defaultBottomNavigationBarItem(icon: Icons.category, text: "Categories"),
              defaultBottomNavigationBarItem(icon: Icons.shop, text: "Product"),
              defaultBottomNavigationBarItem(icon: Icons.settings_outlined, text: "Setting"),
            ],
            onTap: (index){
              cubit.chnageIndex(index);
            },
            currentIndex: cubit.currentIndex,
          ),
        );
        },
        
      ),
    );
  }
}