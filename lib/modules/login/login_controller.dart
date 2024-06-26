import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';

import 'package:cash_swift/shared/auth/auth_controller.dart';
import 'package:cash_swift/shared/models/user_model.dart';

class LoginController {
  final authController = AuthController();

  Future<void> googleSignIn(
    BuildContext context, [
    bool mounted = true,
  ]) async {
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      final response = await googleSignIn.signIn();
      final user = UserModel(
        name: response?.displayName as String,
        photoURL: response?.photoUrl as String,
      );
      if (!mounted) return;
      authController.setUser(context, user);
      debugPrint('Response: $response');
    } catch (e, s) {
      authController.setUser(context, null);
      debugPrint('Error when signing in with Google: ${e.toString()}');
      debugPrint('Stack when signing in with Google: ${s.toString()}');
    }
  }
}
