import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/external/controller/base_controller.dart';
import 'package:project_ref_getx/app/core/mixins/base_style.dart';

abstract class BaseViewController<T extends BaseController> extends GetView<T> with BaseStyle{}