import 'package:project_ref_getx/app/core/external/provider/api/dto/base_api_dto.dart';

class ResumoLembreteModel extends BaseApiDTO{

  final int quantidade;
  final double valor;

  ResumoLembreteModel({
    this.quantidade,
    this.valor,
  });

}