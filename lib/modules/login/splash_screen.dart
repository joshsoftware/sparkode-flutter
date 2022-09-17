import 'package:flutter/material.dart';
import 'package:sparkode/base/Model/base_request_model.dart';
import 'package:sparkode/services/login_services.dart';
import 'package:sparkode/utility/common_widgets/alert_bar.dart';
import 'package:sparkode/utility/constants/assets.dart';
import 'package:sparkode/utility/constants/colors.dart';
import 'package:sparkode/utility/helpers/shared_pref_helper/shared_pred_helper.dart';
import 'package:sparkode/utility/navigator/navigation_pages.dart';
import 'package:sparkode/utility/navigator/navigator.dart';
import 'package:sparkode/views/common_views/login_text_field.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    init();
  }


  Future init() async{
    await Preference.load();
    if(Preference.getHeaders("headers")!=null){
      AppNavigator.instance.navigateTo(name: NavigationPages.home);
    }
    else{
      AppNavigator.instance.navigateTo(name: NavigationPages.kLogin);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackRock,
      body: Center(child:SizedBox(height: 70, child: Image.asset(Assets.logo)),),
    );
  }
}
