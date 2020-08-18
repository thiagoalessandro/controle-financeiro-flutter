import 'package:project_ref_getx/app/core/external/entity/base_entity.dart';

abstract class BaseItemWidget<T extends BaseEntity>{

  generate(T entity);

}
