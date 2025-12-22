import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snapsticker/core/network/api_end_points.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(_) => Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));
