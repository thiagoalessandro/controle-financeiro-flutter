import 'package:project_ref_getx/app/core/external/mapper/i_mapper.dart';
import 'package:project_ref_getx/app/modules/dashboard/data/models/resumo_despesa_model.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/entities/resumo_despesa_entity.dart';

class ResumoDespesaMapper implements IMapper<ResumoDespesaModel, ResumoDespesaEntity> {

  @override
  ResumoDespesaEntity from([ResumoDespesaModel object]) {
  return ResumoDespesaEntity(
      quantidade: object.quantidade,
      valor: object.valor,
    );
  }

  @override
  ResumoDespesaModel convert([json]){
    return ResumoDespesaModel(
      quantidade: json["quantidade"] as int,
      valor: json["valor"] as double,
    );
  }

  @override
  Map toJson([ResumoDespesaEntity json]) {
    throw UnimplementedError();
  }

}
