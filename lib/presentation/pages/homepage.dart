import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_authentication_app/presentation/pages/delete_account_page.dart';
import 'package:firebase_authentication_app/presentation/pages/update_password_screen.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {

    void updatePassword(BuildContext context) {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UpdatePasswordScreen()
          )
      );
    }

    void signUserOut() {
      FirebaseAuth.instance.signOut();
    }

    void deleteAccount() {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DeleteAccountPage()
          )
      );
    }


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
      ),
      body: Column(
        children: [
          // Logged In card with icon and rectangle border
          Card(
            margin: const EdgeInsets.all(16.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(Icons.email, size: 28),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Logged In: ${user.email!}",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Settings heading
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          SizedBox(height: 10),

          // Settings options container
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 2,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.lock),
                  title: Text('Change Password'),
                  onTap: () {
                    // Navigate or show dialog
                    updatePassword(context);
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.delete_forever),
                  title: Text('Delete My Account'),
                  onTap: () {
                    // Show confirmation dialog
                    deleteAccount();
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                  onTap: signUserOut,
                ),
              ],
            ),
          ),
        ],



      ),
    );
  }


}
