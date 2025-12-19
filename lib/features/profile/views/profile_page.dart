import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapsticker/features/settings/views/settings_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: CircleAvatar(child: Icon(Icons.person_outline)),
        ),
        title: Column(
          crossAxisAlignment: .start,
          children: [
            Text(user!.displayName.toString(), style: TextStyle(fontSize: 16)),
            Text(user!.email.toString(), style: TextStyle(fontSize: 12)),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.share_outlined)),
          IconButton(
            onPressed: () {
              Get.to(SettingsPage());
            },
            icon: Icon(Icons.settings_outlined),
          ),
        ],
      ),
    );
  }
}
