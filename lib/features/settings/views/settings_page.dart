import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:snapsticker/features/auth/viewModels/auth_async_notifier.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
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
              buildShowDialog(context, ref);
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
  Future<dynamic> buildShowDialog(BuildContext context, WidgetRef ref) {
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
                onPressed: () {
                  ref.read(authAsyncProvider.notifier).logOut();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white,
                ),
                child: Text('Log Out'),
              ),
              OutlinedButton(
                onPressed: () {
                  context.pop();
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
