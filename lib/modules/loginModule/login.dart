import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_android_othman_akram/modules/Register/register.dart';
import 'package:project_android_othman_akram/shared/appCubit/cubit.dart';
import 'package:project_android_othman_akram/shared/appStatus/states.dart';
import 'package:project_android_othman_akram/shared/components/components.dart';
//import 'package:second_project/shared/components/components.dart';

class Login extends StatelessWidget {
  var AddressController = TextEditingController();

  var passwordController = TextEditingController();

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
                      'LOGIN',
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
                        text: "LOGIN",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            cubit.login(
                                email: AddressController.text,
                                password: passwordController.text);
                            // cubit.tryToken();
                          }
                        }),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account ?'),
                        TextButton(
                            onPressed: () {
                              cubit.changeIndexToRegister();
                            },
                            child: Text('Register'))
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
