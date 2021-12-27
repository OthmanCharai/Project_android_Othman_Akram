import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_android_othman_akram/modules/category/category.dart';
import 'package:project_android_othman_akram/modules/home/home.dart';
import 'package:project_android_othman_akram/modules/product/product.dart';
import 'package:project_android_othman_akram/modules/setting/setting.dart';
import 'package:project_android_othman_akram/shared/appStatus/homeState.dart';

class HomeCubit extends Cubit<HomeState> {
  /*
  // default constractor
  */
  HomeCubit() : super(InitialHomeState());
  /*
  // default instance
  */
  static HomeCubit get(context) => BlocProvider.of(context);
  List<Widget> screens = [
    Home(),
    Category(),
    Product(),
    Setting(),
  ];
  int currentIndex = 0;
  /*
  //Change Current Index
  */
  void chnageIndex(int index) {
    this.currentIndex = index;
    emit(ChangeCurrentIndex());
  }
}
