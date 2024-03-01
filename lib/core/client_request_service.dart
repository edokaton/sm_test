import 'dart:io';

import 'package:dio/dio.dart';

class ClientRequest {
  String baseUrl = "https://jsonplaceholder.typicode.com/";
  final Dio dio = Dio();
  ClientRequest() {
    dioInterceptors();
  }

  void dioInterceptors() {
    dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 33),
      baseUrl: baseUrl,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
