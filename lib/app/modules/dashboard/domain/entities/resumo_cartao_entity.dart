import 'package:project_ref_getx/app/core/external/entity/base_entity.dart';

class ResumoCartaoEntity extends BaseEntity {
  double valorAtual;
  double valorProjecao;

  ResumoCartaoEntity({
    this.valorAtual,
    this.valorProjecao,
  });
}
