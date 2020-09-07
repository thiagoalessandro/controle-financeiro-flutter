import 'package:project_ref_getx/app/core/external/entity/base_entity.dart';

class GastoPeriodoEntity extends BaseEntity {
  String periodo;
  double valor;

  GastoPeriodoEntity({
    this.periodo,
    this.valor,
  });
}
