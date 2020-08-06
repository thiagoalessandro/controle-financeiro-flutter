import 'package:project_ref_getx/app/core/external/mapper/i_mapper.dart';
import 'package:project_ref_getx/app/features/lembrete/data/models/lembrete_model.dart';
import 'package:project_ref_getx/app/features/lembrete/domain/entities/lembrete_entity.dart';

class LembreteMapper implements IMapper<LembreteModel, LembreteEntity> {
  @override
  LembreteEntity from([LembreteModel object]) {
    return LembreteEntity(
      id: object.id,
      categoria: object.categoria,
      dataCompra: object.dataCompra,
      observacao: object.observacao,
      responsavel: object.responsavel,
      valor: object.valor,
    );
  }

  @override
  LembreteModel to([LembreteEntity object]) {
    return LembreteModel(
      id: object.id,
      categoria: object.categoria,
      dataCompra: object.dataCompra,
      observacao: object.observacao,
      responsavel: object.responsavel,
      valor: object.valor,
    );
  }

  @override
  LembreteModel convert([dynamic json]) {
    return LembreteModel(
      id: json["id"] as int,
      categoria: json["categoria"] as String,
      dataCompra: DateTime.parse(json["dataCompra"]),
      observacao: json["observacao"] as String,
      responsavel: json["responsavel"] as String,
      valor: json["valor"] as double,
    );
  }
}
