import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow_flutter/shared/auth/auth_controller.dart';
import 'package:payflow_flutter/shared/models/user.dart';

class LoginController {
  final authController = AuthController();
  Future<void> googleSignIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: ['email'],
    );
    try {
      final response = await _googleSignIn.signIn();
      final user =
          UserModel(name: response!.displayName!, photoUrl: response.photoUrl);
      authController.SetUser(context, user);
      print(response);
    } catch (e) {
      authController.SetUser(context, null);
      print(e);
    }
  }
}
