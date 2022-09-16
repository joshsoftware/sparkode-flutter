import 'package:flutter/material.dart';
import 'package:sparkode/utility/navigator/navigator.dart';
import 'package:sparkode/view_models/dash_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppNavigator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DashboardViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter + MVVM + Provider',
        home: Router(
          routerDelegate: AppNavigator.instance,
          backButtonDispatcher: RootBackButtonDispatcher(),
        ),
      ),
    );
  }
}
