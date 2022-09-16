import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sparkode/models/login_model/login_response_model.dart';
import 'package:sparkode/services/login_services.dart';
import 'package:sparkode/utility/common_widgets/alert_bar.dart';
import 'package:sparkode/utility/constants/assets.dart';
import 'package:sparkode/utility/constants/constant.dart';

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
        title: Text("Welcome to Sparkode"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 70, child: Image.asset(Assets.logo)),
            TextField(
              decoration: InputDecoration(hintText: "Email"),
              onChanged: (value) {
                email = value;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Password"),
              obscureText: true,
              onChanged: ((value) {
                password = value;
              }),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              height: 50,
              child: ElevatedButton(
                  onPressed: () async {
                    if (email == "" || password == "") {
                      AlertBar.show(context,
                          title: "Error",
                          description: "Please enter email and password",
                          durationInMilliseconds: 1000);
                      return;
                    }
                    final response =
                        await loginServices.loginUser(email, password);
                    if (response.isSuccess) {
                      final responseModel = LoginResponseModel.fromJson(
                          response.data as Map<String, dynamic>);
                      debugPrint(responseModel.data.authToken);
                    } else {
                      debugPrint("errorMap ${response.data}");
                      final errorMap = response.data as Map<String, dynamic>;

                      final errorMessage =
                          (errorMap["errors"] as List<dynamic>).join(', ');
                      AlertBar.show(context,
                          title: "Login Error", description: errorMessage);
                    }
                  },
                  child: const Text("Login")),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: () {}, child: Text("Forgot password"))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
