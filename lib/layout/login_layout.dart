import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_android_othman_akram/shared/appCubit/cubit.dart';
import 'package:project_android_othman_akram/shared/appStatus/states.dart';

class LoginLayout extends StatelessWidget {
  const LoginLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
      listener: (context, state) {},
      builder: (context, state){
        var cubit=AppCubit.get(context);

          return  Scaffold(
               appBar:AppBar(
            titleSpacing: 20.0,
              title: Text(
                "Salla",
              ),
              actions: [
                IconButton(
                  onPressed: (){
          
                  }, 
                  icon: Icon(Icons.search),
                  ),
              ],
          ),
              body:cubit.LoginScreens[cubit.index], 
            );
      },
   
    );
  }
}