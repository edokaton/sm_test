import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sekawan_media_test/routes/main_routes.dart';
import 'package:sekawan_media_test/core/client_request_service.dart';

void main() {
  runZonedGuarded(
    () async {
      HttpOverrides.global = MyHttpOverrides();

      runApp(const MainApp());
    },
    (error, stackTrace) {
      debugPrint("mainapp error => $error");
    },
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainScreen(),
      theme: ThemeData(
        fontFamily: "satoshi",
      ),
    );
  }
}
