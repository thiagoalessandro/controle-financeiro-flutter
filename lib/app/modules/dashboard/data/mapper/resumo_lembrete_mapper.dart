import 'package:project_ref_getx/app/core/external/mapper/i_mapper.dart';
import 'package:project_ref_getx/app/modules/dashboard/data/models/resumo_lembrete_model.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/entities/resumo_lembrete_entity.dart';

class ResumoLembreteMapper implements IMapper<ResumoLembreteModel, ResumoLembreteEntity> {

  @override
  ResumoLembreteEntity from([ResumoLembreteModel object]) {
  return ResumoLembreteEntity(
      quantidade: object.quantidade,
      valor: object.valor,
    );
  }

  @override
  ResumoLembreteModel convert([json]){
    return ResumoLembreteModel(
      quantidade: json["quantidade"] as int,
      valor: json["valor"] as double,
    );
  }

  @override
  Map toJson([ResumoLembreteEntity json]) {
    throw UnimplementedError();
  }

}
