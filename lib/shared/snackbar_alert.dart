import 'package:flutter/material.dart';
import 'package:sekawan_media_test/core/app_color.dart';
import 'package:sekawan_media_test/core/typography.dart';

enum SnackbarType {
  primary(AppColor.primary),
  success(AppColor.success),
  warning(AppColor.warning),
  danger(AppColor.danger),
  dark(AppColor.dark);

  const SnackbarType(this.value);
  final Color value;
}

dynamic snackbarAlert(
  String message, {
  required BuildContext currentContext,
  SnackbarType type = SnackbarType.danger,
  int duration = 3,
}) {
  var title = type == SnackbarType.danger
      ? ""
      : type == SnackbarType.success
          ? "Berhasil"
          : "Info";
  final snackBar = SnackBar(
    content: Text(
      "$title $message",
      style: caption1,
    ),
    backgroundColor: type.value,
    duration: Duration(seconds: duration),
    margin: const EdgeInsets.all(16),
    showCloseIcon: true,
    behavior: SnackBarBehavior.floating,
  );

  ScaffoldMessenger.of(currentContext).showSnackBar(snackBar);
}
