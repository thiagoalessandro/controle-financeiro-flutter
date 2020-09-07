import 'package:flutter/cupertino.dart';
import 'package:project_ref_getx/app/core/external/provider/api/dto/base_api_dto.dart';

class ResponsavelModel extends BaseApiDTO{
  final String nome;

  ResponsavelModel({
    @required this.nome,
  });
}
