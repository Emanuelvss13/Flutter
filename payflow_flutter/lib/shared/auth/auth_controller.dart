import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payflow_flutter/modules/Home/home_page.dart';
import 'package:payflow_flutter/modules/Login/login_page.dart';
import 'package:payflow_flutter/shared/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  var _isAuthenticated = false;
  UserModel? _user;

  UserModel get user => _user!;

  void SetUser(BuildContext context, UserModel? user) {
    if (user != null) {
      SaveUser(user);
      _user = user;
      _isAuthenticated = true;
      Navigator.pushReplacementNamed(context, "/home");
    } else {
      _isAuthenticated = false;
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  Future<void> SaveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString("user", user.toJson());
    return;
  }

  Future<void> CurrentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 2));
    if (instance.containsKey("user")) {
      final json = instance.get("user") as String;
      SetUser(context, UserModel.fromJson(json));
      return;
    } else {
      SetUser(context, null);
      return;
    }
  }
}
