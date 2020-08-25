import 'package:project_ref_getx/app/core/external/entity/base_entity.dart';

class LembreteEntity extends BaseEntity {
  int id;
  String observacao;
  DateTime dataCompra;
  double valor;
  String responsavel;

  LembreteEntity({
    this.id,
    this.dataCompra,
    this.valor,
    this.responsavel,
    this.observacao,
  });
}
