import 'package:dio/native_imp.dart';

class HttpClient extends DioForNative {
  static HttpClient? _instancia;

  factory HttpClient() {
    return _instancia ??= HttpClient._();
  }

  HttpClient._() {
    options.baseUrl = 'https://jsonplaceholder.typicode.com';
  }
}
