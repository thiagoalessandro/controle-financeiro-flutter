import 'package:project_ref_getx/app/core/external/provider/api/dto/base_api_dto.dart';

class LembreteModel extends BaseApiDTO{

  final int id;
  final String observacao;
  final DateTime dataCompra;
  final double valor;
  final String responsavel;
  final String categoria;

  LembreteModel({
    this.id,
    this.dataCompra,
    this.valor,
    this.responsavel,
    this.categoria,
    this.observacao,
  });

}