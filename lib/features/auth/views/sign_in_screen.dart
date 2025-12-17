import 'package:flutter/material.dart';
import 'package:snapsticker/features/auth/services/auth_services.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  AuthServices authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                onPressed: () async {
                  final user = await authServices.signInWithGoogle();
                  if (user != null) {
                    Navigator.pushReplacementNamed(context, '/main-nav-screen');
                  }
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
    );
  }
}
