import 'package:project_ref_getx/app/core/external/provider/api/dto/base_api_dto.dart';

class GastoPeriodoModel extends BaseApiDTO{

  final String periodo;
  final double valor;

  GastoPeriodoModel({
    this.periodo,
    this.valor,
  });

}