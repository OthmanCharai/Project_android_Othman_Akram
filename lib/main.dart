import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_android_othman_akram/layout/login_layout.dart';
import 'package:project_android_othman_akram/modules/loginModule/login.dart';
import 'package:project_android_othman_akram/shared/appCubit/cubit.dart';
import 'package:project_android_othman_akram/shared/appStatus/states.dart';
import 'package:project_android_othman_akram/shared/network/remote/LoginDio.dart';
import 'package:flutter/widgets.dart';

void main() {
  LoginDio.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..readToken(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return MaterialApp(
            title: 'Flutter Demo',
          
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.blue,
              bottomNavigationBarTheme:BottomNavigationBarThemeData(
                backgroundColor: Colors.white38,
                selectedIconTheme: IconThemeData(
                  color:Colors.deepOrange,
                  size: 20.0
                )
                
              )
            ),
          
            home: ConditionalBuilder(
              condition: cubit.isAuth,
              builder: (context) =>LoginLayout(),
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
            
          );
        },
      ),
    );
  }
}
