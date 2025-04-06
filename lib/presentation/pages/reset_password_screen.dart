import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_authentication_app/domain/usecases/auth_service.dart';

import '../widgets/my_button.dart';
import '../widgets/my_textfield.dart';
import '../widgets/snack_util.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();


    void resetPassword() async {
      try {
        if (emailController.text.isEmpty) {
          SnackUtil.showSnackBar(context, "Please enter your email.");
          return;
        }
        await authService.value.resetPassword(email: emailController.text);
        SnackUtil.showSnackBar(context, "Password reset link sent!");
        Navigator.pop(context);
      } catch (e) {
        SnackUtil.showSnackBar(context, "'Failed to reset password: ${e.toString()}");
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // 👈 This takes you back
          },
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Reset password',
                  style: TextStyle(color: Colors.grey[900], fontSize: 25),
                ),
                const SizedBox(height: 20),
                //logo
                const Icon(Icons.lock, size: 100),

                const SizedBox(height: 50),

                SizedBox(height: 25),

                // Email textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.end),
                ),
                const SizedBox(height: 25),

                // Reset button
                MyButton(onTap: resetPassword, text: 'Reset Password'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
