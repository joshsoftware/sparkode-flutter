import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sparkode/models/login_model/login_response_model.dart';
import 'package:sparkode/services/login_services.dart';
import 'package:sparkode/utility/common_widgets/alert_bar.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginServices loginServices = LoginServices();
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sparkode"),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: "Email"),
            onChanged: (value) {
              email = value;
            },
          ),
          TextField(
            decoration: InputDecoration(hintText: "Password"),
            onChanged: ((value) {
              password = value;
            }),
          ),
          ElevatedButton(
              onPressed: () async {
                if (email == "" || password == "") {
                  AlertBar.show(context,
                      title: "Error",
                      description: "Please enter email and password",
                      durationInMilliseconds: 1000);
                  return;
                }
                final response = await loginServices.loginUser(email, password);
                if (response.isSuccess) {
                  final responseModel = LoginResponseModel.fromJson(
                      response.data as Map<String, dynamic>);
                  debugPrint(responseModel.data.authToken);
                } else {
                  debugPrint("errorMap ");
                  final errorMap = response.data as Map<String, dynamic>;

                  final errorMessage =
                      (errorMap["errors"] as List<String>).join(', ');
                  AlertBar.show(context,
                      title: "Login Error", description: errorMessage);
                }
              },
              child: const Text("Login"))
        ],
      ),
    );
  }
}
