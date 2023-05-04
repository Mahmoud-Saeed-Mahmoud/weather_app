import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../../models/request_type_enum.dart';
import '../../shared/constants/api_constants.dart';

class Api {
  final Future<Dio> _dio;
  Api(this._dio);

  Future<Response> gettWeather(
      {required RequestTypeEnum typeEnum,
      required Map<String, String> query}) async {
    return _dio.then(
      (value) => value.get(
        typeEnum.value,
        queryParameters: {
          'key': apiKey,
          ...query,
        },
      ),
    );
  }
}

final apiProvider = Provider<Api>(
  (ref) => Api(
    ref.watch(dioProvider.future),
  ),
);

final dioProvider = FutureProvider<Dio>(
  (ref) async {
    final dir = await getApplicationDocumentsDirectory();
    return Dio(
      BaseOptions(
        baseUrl: baseUrl,
      ),
    )..interceptors.add(
        DioCacheInterceptor(
          options: CacheOptions(
            store: HiveCacheStore(dir.path),
            hitCacheOnErrorExcept: [],
          ),
        ),
      );
  },
);
