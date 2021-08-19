import 'package:flutter/material.dart';
import 'package:payflow_flutter/modules/Home/home_page.dart';
import 'package:payflow_flutter/modules/Login/login_page.dart';
import 'package:payflow_flutter/modules/splash/splash_page.dart';
import 'package:payflow_flutter/shared/themes/app_colors.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: AppColors.primary),
      home: HomePage(),
    );
  }
}
