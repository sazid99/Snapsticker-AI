import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:snapsticker/app.dart';
import 'package:snapsticker/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}
