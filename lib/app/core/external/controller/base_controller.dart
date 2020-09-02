import 'package:get/get.dart';
import 'package:logger/logger.dart';

abstract class BaseController extends GetxController {
  final Logger logger = Get.find<Logger>();
  String get title;
}
