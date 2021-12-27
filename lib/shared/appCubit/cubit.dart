import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_android_othman_akram/layout/home_layout.dart';
import 'package:project_android_othman_akram/models/User/userModel.dart';
import 'package:project_android_othman_akram/modules/Register/register.dart';
import 'package:project_android_othman_akram/modules/loginModule/login.dart';
import 'package:project_android_othman_akram/shared/appStatus/states.dart';
import 'package:project_android_othman_akram/shared/network/remote/LoginDio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitialState());
  //late String token;
  late bool isAuth = false;
  Map<dynamic, dynamic> user = Map<dynamic, dynamic>();
  late TextEditingController email;
  late TextEditingController password;
  late List<User> users;
  int index = 0;
  bool isPasswword = true;
  List<Widget> LoginScreens = [
    Login(),
    HomeLayout(),
    Register(),
  ];

  /*
  // Instance of AppCubit
  */
  static AppCubit get(context) => BlocProvider.of(context);
  /*
  // Login Function
  */
  void login({
    required String email,
    required String password,
    String device_name = "pc",
  }) async {
    LoginDio.userLogin(url: "api/v1/login", info: {
      "email": "${email}",
      "password": "${password}",
      "device_name": device_name,
    }).then((value) {
      //token = value.data.toString();
      tryToken(token: value.data.toString());
      print(value.data.toString());
    }).catchError((onError) {
      print(onError);
    });
  }

  /*
  // Try Token
  */
  void tryToken({
    required String token,
  }) async {
    print("THIS IS THE TOKEN${token}");
    if (token == "") {
      print("token is invalide ");
      return;
    } else {
      try {
        Response response =
            await LoginDio.getUser(url: "api/v1/user", token: token);
        //print(response.data);
        print(response.data['email']);

        this.storeToken(token: token);
        /*  User user = User(response.data['name'], response.data['email'],
            response.data['password']);
        users.add(user);  */
        this.index = 1;
        isAuth = true;
        print(index);
        emit(LoadingState());
      } catch (e) {
        print(e);
      }
    }
  }
  /*
  // Store Token
  */

  void storeToken({required String token}) async {
    final storage = new FlutterSecureStorage();
    if (token != "") {
      await storage.write(key: "token", value: token);
    }
  }

  /*
  // Read Token
  */
  void readToken() async {
    final storage = new FlutterSecureStorage();
    storage.read(key: "token").then((value) {
      print("hhhhhhh the old token${value.toString()}");
      tryToken(token: value.toString());
    });
  }

  /*
  // Register Function
  */
  Future register({
    required String name,
    required String email,
    required String password,
  }) async {
    LoginDio.Register(url: "/api/v1/register", info: {
      "email": "${email}",
      "name": "${name}",
      "password": "${password}",
    }).then((value) {
      print(value);
      Fluttertoast.showToast(
          msg: "You have register with success try to ligin now",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    }).catchError((error) {
      Fluttertoast.showToast(
          msg: "Some Think was wrang please try again",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      print(error);
    });
  }

  /*
  // Register Screen
  */
  void changeIndexToRegister() {
    this.index = 1;
    emit(ChangeIndexToRegister());
  }

  /*
  // Login Screen
  */
  void changeIndexToLogin() {
    this.index = 0;
    emit(ChangeIndexToLogin());
  }

  /*
  // Login Screen
  */
  void showPassword() {
    isPasswword = !isPasswword;
    emit(ShowPassword());
  }
}
