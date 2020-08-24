import 'package:project_ref_getx/app/core/external/mapper/i_mapper.dart';
import 'package:project_ref_getx/app/features/responsavel/data/models/responsavel_model.dart';
import 'package:project_ref_getx/app/features/responsavel/domain/entities/reponsavel_entity.dart';

class ResponsavelMapper implements IMapper<ResponsavelModel, ResponsavelEntity>{
  @override
  ResponsavelEntity from([ResponsavelModel object]) {
    return ResponsavelEntity(
      nome: object.nome,
    );
  }

  @override
  ResponsavelModel to([ResponsavelEntity object]) {
    return ResponsavelModel(
      nome: object.nome,
    );
  }

  @override
  ResponsavelModel convert([dynamic json]) {
    return ResponsavelModel(
      nome: json["nome"] as String,
    );
  }
}