import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_android_othman_akram/modules/loginModule/login.dart';
import 'package:project_android_othman_akram/shared/appCubit/cubit.dart';
import 'package:project_android_othman_akram/shared/appStatus/states.dart';
import 'package:project_android_othman_akram/shared/components/components.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  var AddressController = TextEditingController();

  var passwordController = TextEditingController();
  var nameController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  IconData icons = Icons.remove_red_eye;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, status) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                      onFieldSubmitted: (value) {
                        print(value);
                      },
                      onChanged: (value) {
                        print(value);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "name can t be null ";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: AddressController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                      ),
                      onFieldSubmitted: (value) {
                        print(value);
                      },
                      onChanged: (value) {
                        print(value);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email can t be null ";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: cubit.isPasswword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(icons),
                          onPressed: () {
                            cubit.showPassword();
                            icons = cubit.isPasswword
                                ? Icons.visibility
                                : Icons.visibility_off;
                          },
                        ),
                      ),
                      onFieldSubmitted: (value) {
                        print(value);
                      },
                      onChanged: (value) {
                        print(value);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password can t be null ";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultButton(
                        text: 'Register',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            cubit
                                .register(
                              email: AddressController.text,
                              password: passwordController.text,
                              name: nameController.text,
                            )
                                .then((value) {
                              print(value);
                            }).catchError((error) {
                              Fluttertoast.showToast(
                                  msg: "Something was wrong try again",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.SNACKBAR,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red[800],
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            });
                            // cubit.tryToken();
                          }
                        }),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Login'),
                        TextButton(
                            onPressed: () {
                              /*  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            }, */
                              cubit.changeIndexToLogin();
                            },
                            child: Text('Login'))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
