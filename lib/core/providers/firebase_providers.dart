import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_providers.g.dart';

@riverpod
Future<FirebaseApp> firebase(_) => Firebase.initializeApp();

@riverpod
FirebaseAuth firebaseAuth(_) => FirebaseAuth.instance;

@riverpod
GoogleSignIn googleSignIn(_) => GoogleSignIn.instance;

@riverpod
Stream<User?> authStateChange(Ref ref) {
  return ref.watch(firebaseAuthProvider).authStateChanges();
}
