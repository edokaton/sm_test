import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sekawan_media_test/core/client_request_service.dart';

class PostsRepository {
  final Dio dio = ClientRequest().dio;

  Future getPostList(Map<String, dynamic> query) async {
    const endPoint = 'posts';

    try {
      final response = await dio.get(endPoint);
      return response;
    } on DioException catch (e) {
      return "$e";
    } catch (e, s) {
      debugPrint("error getPostList: $e, stack: $s");
      return "$e";
    }
  }
}
