import 'package:project_ref_getx/app/core/external/mapper/i_mapper.dart';
import 'package:project_ref_getx/app/features/lembrete/data/models/lembrete_model.dart';
import 'package:project_ref_getx/app/features/lembrete/domain/entities/lembrete_entity.dart';

class LembreteMapper implements IMapper<LembreteModel, LembreteEntity> {
  @override
  LembreteEntity from([LembreteModel object]) {
    return LembreteEntity(
      id: object.id,
      dataCompra: DateTime.fromMillisecondsSinceEpoch(object.dataCompra),
      observacao: object.observacao,
      responsavel: object.responsavel,
      valor: object.valor,
    );
  }

  @override
  Map toJson([LembreteEntity object]) {
    return {
      'id': object.id,
      'dataCompra': object.dataCompra.millisecondsSinceEpoch,
      'observacao': object.observacao,
      'responsavel': object.responsavel,
      'valor': object.valor,
    };
  }

  @override
  LembreteModel convert([dynamic json]) {
    return LembreteModel(
      id: json["id"] as int,
      dataCompra: json["dataCompra"] as int,
      observacao: json["observacao"] as String,
      responsavel: json["responsavel"] as String,
      valor: json["valor"] as double,
    );
  }
}
