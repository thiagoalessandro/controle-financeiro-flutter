import 'package:project_ref_getx/app/core/environment/development_env.dart';
import 'package:project_ref_getx/app/core/environment/production_env.dart';

import 'configuration_env.dart';

const bool isProduction = bool.fromEnvironment('dart.vm.product');

final ConfigurationEnv environment = isProduction ? productionConfig : developmentConfig;
