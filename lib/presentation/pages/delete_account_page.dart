import 'package:flutter/material.dart';

import '../../domain/usecases/auth_service.dart';
import '../widgets/my_button.dart';
import '../widgets/my_textfield.dart';
import '../widgets/snack_util.dart';

class DeleteAccountPage extends StatelessWidget {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final PasswordController = TextEditingController();


    void deletePermanently() async {
      try {
        await authService.value.deleteAccount(
          email: emailController.text,
          password: PasswordController.text,
        );
        SnackUtil.showSnackBar(context, "Account deleted");
        Navigator.pop(context);
      } catch (e) {
        SnackUtil.showSnackBar(context, "Failed to delete account");
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
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Delete Account',
                  style: TextStyle(color: Colors.grey[900], fontSize: 25),
                ),
                const SizedBox(height: 25),
                //logo
                const Icon(Icons.dangerous_outlined, size: 100),
                SizedBox(height: 25),

                // email text field
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                SizedBox(height: 10),

                // password text field
                MyTextField(
                  controller: PasswordController,
                  hintText: 'Current Password',
                  obscureText: false,
                ),

                SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.end),
                ),
                const SizedBox(height: 25),

                // Delete button
                MyButton(onTap: deletePermanently, text: 'Delete permanently'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
