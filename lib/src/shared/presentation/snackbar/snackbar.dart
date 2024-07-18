import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class NotificationClass {
  void newshowSnackbar(
      BuildContext context, String title, String message, contentType) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        content: AwesomeSnackbarContent(
            inMaterialBanner: true,
            title: title,
            message: message,
            contentType: contentType)));
  }
}
