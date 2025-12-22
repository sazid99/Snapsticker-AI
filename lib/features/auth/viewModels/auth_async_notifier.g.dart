// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_async_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuthAsyncNotifier)
const authAsyncProvider = AuthAsyncNotifierProvider._();

final class AuthAsyncNotifierProvider
    extends $AsyncNotifierProvider<AuthAsyncNotifier, void> {
  const AuthAsyncNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authAsyncProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authAsyncNotifierHash();

  @$internal
  @override
  AuthAsyncNotifier create() => AuthAsyncNotifier();
}

String _$authAsyncNotifierHash() => r'6ebc73ffcb9e4223170e08034daadb1e0824d21b';

abstract class _$AuthAsyncNotifier extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
