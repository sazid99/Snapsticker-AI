import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.greenAccent,
          ),
        ),
        title: Text('Settings', style: TextStyle(color: Colors.greenAccent)),
      ),
      body: ListView(
        children: [
          Divider(thickness: 0.5),
          buildListTile(title: 'Name', trailingText: user!.displayName),
          Divider(thickness: 0.5),
          buildListTile(title: 'Email', trailingText: user.email),
          Divider(thickness: 0.5),
          buildListTile(title: 'Phone Number', trailingText: user.phoneNumber),
          Divider(thickness: 0.5),
          ListTile(
            onTap: () {
              buildShowDialog(context);
            },
            title: Text('Log Out'),
            trailing: Icon(Icons.logout_outlined),
          ),
          Divider(thickness: 0.5),
        ],
      ),
    );
  }

  //note: custom show dialog method
  Future<dynamic> buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Are you sure you want to log out?',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        content: SizedBox(
          height: 180,
          child: Column(
            spacing: 20,
            children: [
              Text(
                'You saved your credentials, so logging back in will be easy.',
              ),
              ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  await GoogleSignIn.instance.signOut();
                  Get.until((route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white,
                ),
                child: Text('Log Out'),
              ),
              OutlinedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('Cancel'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //note: custom list tile
  ListTile buildListTile({String? title, String? trailingText}) {
    return ListTile(
      title: Text(title.toString()),
      trailing: Text(trailingText.toString(), style: TextStyle(fontSize: 14)),
    );
  }
}
