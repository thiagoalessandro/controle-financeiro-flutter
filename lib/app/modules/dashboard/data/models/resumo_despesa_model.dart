import 'package:project_ref_getx/app/core/external/provider/api/dto/base_api_dto.dart';

class ResumoDespesaModel extends BaseApiDTO{

  final int quantidade;
  final double valor;

  ResumoDespesaModel({
    this.quantidade,
    this.valor,
  });

}