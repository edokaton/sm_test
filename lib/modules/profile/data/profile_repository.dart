import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sekawan_media_test/core/client_request_service.dart';

class ProfileRepository {
  final Dio dio = ClientRequest().dio;

  Future getPostDetail({required int postId}) async {
    final endPoint = "posts/$postId";

    try {
      final response = await dio.get(endPoint);
      return response;
    } on DioException catch (e) {
      return "$e";
    } catch (e, s) {
      debugPrint("error getPostDetail: $e, stack: $s");
      return "$e";
    }
  }
}
