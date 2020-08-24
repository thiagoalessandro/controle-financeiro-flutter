import 'package:get/get.dart';
import 'package:logger/logger.dart';

abstract class BaseController extends GetxController{

  final Logger logger = Get.find<Logger>();

  get title;

  notification({String title, String message}){
    Get.rawSnackbar(title: title, message: message);
  }

}