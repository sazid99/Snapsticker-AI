import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snapsticker/features/auth/repositories/auth_repository.dart';

part 'auth_async_notifier.g.dart';

@riverpod
class AuthAsyncNotifier extends _$AuthAsyncNotifier {
  @override
  FutureOr<void> build() {}

  Future<void> signInWithGoogle() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(authRepositoryProvider).signInWithGoogle();
    });
  }

  Future<void> logOut() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(authRepositoryProvider).logOut();
    });
  }
}
