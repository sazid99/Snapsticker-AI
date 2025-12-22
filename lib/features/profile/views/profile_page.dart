import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:snapsticker/core/providers/firebase_providers.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(firebaseAuthProvider).currentUser;
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
            Text(user.email.toString(), style: TextStyle(fontSize: 12)),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.share_outlined)),
          IconButton(
            onPressed: () {
              context.push('/settings-screen');
            },
            icon: Icon(Icons.settings_outlined),
          ),
        ],
      ),
    );
  }
}
