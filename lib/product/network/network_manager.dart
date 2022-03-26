import 'package:dio/dio.dart';
import '../enums/service_path.dart';

class NetworkManager {
  static NetworkManager? _instace;
  static NetworkManager get instance {
    _instace ??= NetworkManager._init();
    return _instace!;
  }

  late final Dio dio;
  NetworkManager._init() {
    dio = Dio(
      BaseOptions(baseUrl: ServicePath.base_Url.rawValue),
    );
  }
}
