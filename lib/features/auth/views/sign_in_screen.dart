import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapsticker/features/auth/viewModels/auth_async_notifier.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(authAsyncProvider);
    return authController.when(
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => Center(child: CircularProgressIndicator()),
      data: (data) => Scaffold(
        //note: body
        backgroundColor: Colors.green,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Snap',
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      'Sticker',
                      style: TextStyle(fontSize: 50, color: Colors.deepOrange),
                    ),
                    Text(
                      '.',
                      style: TextStyle(fontSize: 50, color: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        //note: bottom sheet
        bottomSheet: Container(
          height: 300,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
            child: Column(
              spacing: 20,
              children: [
                //note: google sign in elevated button
                ElevatedButton(
                  onPressed: () {
                    ref.read(authAsyncProvider.notifier).signInWithGoogle();
                  },
                  child: Row(
                    mainAxisAlignment: .center,
                    spacing: 10,
                    children: [
                      Image.asset(
                        'assets/images/google_logo.png',
                        height: 24,
                        width: 24,
                      ),
                      Text(
                        'Continue with Google',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                //note: email password elevated button
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Continue with Email & Password',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
