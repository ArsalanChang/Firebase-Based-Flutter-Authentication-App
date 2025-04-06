import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_authentication_app/domain/usecases/auth_service.dart';
import 'package:firebase_authentication_app/presentation/pages/sign_in_screen.dart';
import 'package:firebase_authentication_app/presentation/pages/sign_up_screen.dart';
import 'package:firebase_authentication_app/presentation/widgets/my_button.dart';
import 'package:firebase_authentication_app/presentation/widgets/my_textfield.dart';
import 'package:firebase_authentication_app/presentation/widgets/square_tile.dart';

import '../../domain/usecases/auth_page.dart';
import '../widgets/snack_util.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignUpScreen> {
  // text editing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUserUp() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await authService.value.createAccount(
          email: emailController.text,
          password: passwordController.text,
        );
        Navigator.pop(context); // Remove loading
        SnackUtil.showSnackBar(context, "Account has been created!");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const AuthLayout()),
        );
      } else {
        Navigator.pop(context); // Remove loading
        showErrorMessage(context, "Passwords do not match");
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context); // Remove loading
      Future.delayed(Duration.zero, () {
        showErrorMessage(context, e.message ?? "An error occurred");
      });
    }
  }

  // Fix: Accept context explicitly
  void showErrorMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Close dialog
              child: const Text("OK", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  void signInUser(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignInScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 25),
                //logo
                const Icon(Icons.lock, size: 50),

                const SizedBox(height: 25),
                //lets create an account for you
                Text(
                  'Let\'s create an account for you!',
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),

                SizedBox(height: 25),

                // username text field
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                SizedBox(height: 10),

                // password text field
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                // confirm password
                SizedBox(height: 10),

                // password text field
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),

                SizedBox(height: 10),

                // forgot password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.end),
                ),
                const SizedBox(height: 25),

                // sign in button
                MyButton(onTap: signUserUp, text: 'Sign Up'),

                const SizedBox(height: 25),

                //or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(thickness: 0.5, color: Colors.grey[400]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(thickness: 0.5, color: Colors.grey[400]),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // not a member?, register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?'),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        signInUser(context);
                      },
                      child: Text(
                        'Login now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
