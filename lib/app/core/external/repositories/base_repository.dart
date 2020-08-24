import 'package:get/get.dart';
import 'package:logger/logger.dart';

abstract class BaseRepository{
  final Logger logger = Get.find<Logger>();
}