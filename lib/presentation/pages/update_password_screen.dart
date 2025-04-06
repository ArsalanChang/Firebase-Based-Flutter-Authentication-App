import 'package:flutter/material.dart';

import '../../domain/usecases/auth_service.dart';
import '../widgets/my_button.dart';
import '../widgets/my_textfield.dart';
import '../widgets/snack_util.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();

    void updatePassword() async {
      try {
        await authService.value.resetPasswordFromCurrentPassword(
          currentPassword: currentPasswordController.text,
          newPassword: newPasswordController.text,
          email: emailController.text,
        );
        SnackUtil.showSnackBar(context, "Password updated");
        Navigator.pop(context);
      } catch (e) {
        SnackUtil.showSnackBar(context, "Failed to reset password");
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
                  'Update password',
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 25),
                ),
                const SizedBox(height: 25),
                //logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),

                SizedBox(height: 25),
                // username text field
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                SizedBox(height: 10,),

                MyTextField(
                  controller: currentPasswordController,
                  hintText: 'Current Password',
                  obscureText: false,
                ),

                SizedBox(height: 10,),

                MyTextField(
                  controller: newPasswordController,
                  hintText: 'New Password',
                  obscureText: false,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                ),
                const SizedBox(height: 25,),

                //update password button
                MyButton(
                  onTap: updatePassword,
                  text: 'Update Password',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
