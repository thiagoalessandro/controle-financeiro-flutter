import 'package:project_ref_getx/app/core/external/provider/api/dto/base_api_dto.dart';

class ResumoCartaoModel extends BaseApiDTO{

  final double valorAtual;
  final double valorProjecao;

  ResumoCartaoModel({
    this.valorAtual,
    this.valorProjecao,
  });

}