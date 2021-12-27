import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_android_othman_akram/shared/appCubit/cubit.dart';

Widget defaultButton({
  required Function()? onPressed,
  required String text,
}) =>Container(
      width: double.infinity,
      color: Colors.blue,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          '$text',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
Widget defaultTextField({
  bool isPassword = false,
  required TextEditingController controller,
  required IconData prefixIcon,
  IconData? icons,
  required Function()? onTaper,
  Function()? pressed,
  Function(String value)? onChnage,
  Function(String value)? onSubmit,
  required FormFieldValidator<String> validate,
  required String label,
  required TextInputType type,
  //required String ? Function (String value)? validate,
}) =>
    TextFormField(
      keyboardType: type,
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(icons),
      ),
      onFieldSubmitted: onSubmit,
      onChanged: onChnage,
      onTap: onTaper,
      validator: validate,
    );
BottomNavigationBarItem defaultBottomNavigationBarItem({
  required IconData icon,
  required String text,
}) {
  return BottomNavigationBarItem(
    icon: Icon(icon),
    label: text,
  );
}

