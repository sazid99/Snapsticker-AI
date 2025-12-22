// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_async_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProfileAsyncNotifier)
const profileAsyncProvider = ProfileAsyncNotifierProvider._();

final class ProfileAsyncNotifierProvider
    extends $AsyncNotifierProvider<ProfileAsyncNotifier, void> {
  const ProfileAsyncNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileAsyncProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileAsyncNotifierHash();

  @$internal
  @override
  ProfileAsyncNotifier create() => ProfileAsyncNotifier();
}

String _$profileAsyncNotifierHash() =>
    r'828415d37e9fb8a1a8b939ea132b4d92e6a9b361';

abstract class _$ProfileAsyncNotifier extends $AsyncNotifier<void> {
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
