import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparkode/utility/navigator/navigator.dart';
import '../../utility/constants/assets.dart';
import '../../utility/constants/colors.dart';
import '../../views/common_views/login_text_field.dart';

class AddInvitation extends StatefulWidget {
  const AddInvitation({Key? key}) : super(key: key);

  @override
  State<AddInvitation> createState() => _AddInvitationState();
}

class _AddInvitationState extends State<AddInvitation> {

  String email= "";

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
                                onPressed:(){},
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
