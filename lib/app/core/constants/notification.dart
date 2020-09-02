import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/enums/notification_type.dart';

class Notification {

  const Notification();

  alert(String message) {
    _notification(type: NotificationType.WARNNING, message: message);
  }

  success(String message) {
    _notification(type: NotificationType.SUCCESS, message: message);
  }

  error(String message) {
    _notification(type: NotificationType.ERROR, message: message);
  }

  _notification({NotificationType type, String message}) {
    Get.rawSnackbar(
        title: type.description,
        message: message,
        backgroundColor: Get.theme.primaryColor,
        icon: Icon(
          Icons.warning,
          color: Colors.white,
        ));
  }
}
// ignore: non_constant_identifier_names
const NotificationCustom = Notification();
