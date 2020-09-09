import 'package:project_ref_getx/app/core/external/mapper/i_mapper.dart';
import 'package:project_ref_getx/app/modules/dashboard/data/models/gasto_periodo_model.dart';
import 'package:project_ref_getx/app/modules/dashboard/data/models/resumo_cartao_model.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/entities/gasto_periodo_entity.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/entities/gasto_periodo_entity.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/entities/gasto_periodo_entity.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/entities/gasto_periodo_entity.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/entities/resumo_cartao_entity.dart';
import 'package:project_ref_getx/app/modules/lembrete/data/models/lembrete_model.dart';
import 'package:project_ref_getx/app/modules/lembrete/domain/entities/lembrete_entity.dart';

class ResumoCartaoMapper implements IMapper<ResumoCartaoModel, ResumoCartaoEntity> {
  @override
  ResumoCartaoEntity from([ResumoCartaoModel object]) {
    return ResumoCartaoEntity(
      valorAtual: object.valorAtual,
      valorProjecao: object.valorProjecao,
    );
  }

  @override
  ResumoCartaoModel convert([json]) {
    return ResumoCartaoModel(
      valorAtual: json["valorAtual"] as double,
      valorProjecao: json["valorProjecao"] as double,
    );
  }

  @override
  Map toJson([ResumoCartaoEntity json]) {
    throw UnimplementedError();
  }

}
