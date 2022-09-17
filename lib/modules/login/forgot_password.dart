import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparkode/models/login_model/forgot_password_response_model.dart';
import 'package:sparkode/utility/navigator/navigator.dart';
import '../../services/login_services.dart';
import '../../utility/common_widgets/alert_bar.dart';
import '../../utility/constants/assets.dart';
import '../../utility/constants/colors.dart';
import '../../views/common_views/login_text_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String email = "";
  final LoginServices loginServices = LoginServices();

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
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 100,
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () async {
                                  if (email == "") {
                                    AlertBar.show(context,
                                        title: "Error",
                                        description:
                                        "Please enter email",
                                        durationInMilliseconds: 1000);
                                    return;
                                  }
                                  final response = await loginServices.forgotPassword(email);
                                  if(response.isSuccess){
                                    final responseModel = ForgotPasswordResponseModel.fromJson(response.data as Map<String,dynamic>);
                                    AlertBar.show(context, title: "Success", description: responseModel.message);
                                  }
                                  else{
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
                                  "Send Request",
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
                                  onPressed: () {
                                    AppNavigator.instance.popRoute();
                                  },
                                  child: Text(
                                    "Back to Login",
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
