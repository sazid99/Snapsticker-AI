import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snapsticker/core/network/dio_provider.dart';

part 'profile_repository.g.dart';

class ProfileRepository {
  final Dio _dio;
  ProfileRepository(this._dio);
}

@riverpod
ProfileRepository profileRepository(Ref ref) =>
    ProfileRepository(ref.watch(dioProvider));
