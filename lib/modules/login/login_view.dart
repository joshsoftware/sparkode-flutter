import 'package:flutter/material.dart';
import 'package:sparkode/base/Model/base_request_model.dart';
import 'package:sparkode/models/login_model/login_response_model.dart';
import 'package:sparkode/services/login_services.dart';
import 'package:sparkode/utility/common_widgets/alert_bar.dart';
import 'package:sparkode/utility/constants/assets.dart';
import 'package:sparkode/utility/constants/colors.dart';
import 'package:sparkode/utility/helpers/shared_pref_helper/shared_pred_helper.dart';
import 'package:sparkode/utility/navigator/navigation_pages.dart';
import 'package:sparkode/utility/navigator/navigator.dart';
import 'package:sparkode/views/common_views/login_text_field.dart';

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
  void initState() {
    super.initState();
    Preference.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackRock,
      appBar: AppBar(
        backgroundColor: const Color(0),
        elevation: 0,
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        "Welcome to",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: AppColors.babyBlue, fontSize: 22),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(height: 70, child: Image.asset(Assets.logo)),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 8,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      LoginTextField(
                          title: "Email",
                          onChanged: (value) {
                            email = value;
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      LoginTextField(
                          title: "Password",
                          isObscured: true,
                          onChanged: (value) {
                            password = value;
                          }),
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
                                    description:
                                        "Please enter email and password",
                                    durationInMilliseconds: 1000);
                                return;
                              }
                              final response = await loginServices.loginUser(
                                  email, password);
                              if (response.isSuccess) {
                                final responseModel =
                                    LoginResponseModel.fromJson(
                                        response.data as Map<String, dynamic>);
                                Preference.setUser("user", responseModel);
                                debugPrint(responseModel.data.authToken);
                                debugPrint(BaseRequestModel.Additionalheader
                                    .toString());
                                AppNavigator.instance.navigateTo(
                                    name: NavigationPages.resultList);
                              } else {
                                final errorMap =
                                    response.data as Map<String, dynamic>;

                                final errorMessage =
                                    (errorMap["errors"] as List<dynamic>)
                                        .join(', ');
                                AlertBar.show(context,
                                    title: "Login Error",
                                    description: errorMessage);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.deepLilac),
                            child: Text(
                              "Login",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  ?.copyWith(color: AppColors.white),
                            )),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forgot password",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    ?.copyWith(color: Colors.white70),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
