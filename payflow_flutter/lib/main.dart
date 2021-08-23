import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:payflow_flutter/modules/Home/home_page.dart';
import 'package:payflow_flutter/modules/Login/login_page.dart';
import 'package:payflow_flutter/modules/splash/splash_page.dart';
import 'package:payflow_flutter/shared/themes/app_colors.dart';

import 'app_widget.dart';

void main() {
  runApp(const AppWidget());
}

class AppFirebase extends StatefulWidget {
  AppFirebase({Key? key}) : super(key: key);

  @override
  _AppFirebaseState createState() => _AppFirebaseState();
}

class _AppFirebaseState extends State<AppFirebase> {
  final Future<AppFirebase> _initialization =
      Firebase.initializeApp() as Future<AppFirebase>;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Material(
              child: Center(
                child: Text(
                  "Não foi possível inicializar o Firebase",
                  textDirection: TextDirection.ltr,
                ),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return AppWidget();
          } else {
            return const Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
