import 'package:project_ref_getx/app/core/external/entity/base_entity.dart';
import 'package:project_ref_getx/app/core/external/provider/api/dto/base_api_dto.dart';

abstract class IMapper<M extends BaseApiDTO, E extends BaseEntity>{
  Map toJson([E object]);
  E from([M object]);
  M convert([dynamic json]);
}