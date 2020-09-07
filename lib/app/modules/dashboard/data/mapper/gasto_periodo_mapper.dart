import 'package:project_ref_getx/app/core/external/mapper/i_mapper.dart';
import 'package:project_ref_getx/app/modules/dashboard/data/models/gasto_periodo_model.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/entities/gasto_periodo_entity.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/entities/gasto_periodo_entity.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/entities/gasto_periodo_entity.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/entities/gasto_periodo_entity.dart';
import 'package:project_ref_getx/app/modules/lembrete/data/models/lembrete_model.dart';
import 'package:project_ref_getx/app/modules/lembrete/domain/entities/lembrete_entity.dart';

class GastoPeriodoMapper implements IMapper<GastoPeriodoModel, GastoPeriodoEntity> {
  @override
  GastoPeriodoEntity from([GastoPeriodoModel object]) {
    return GastoPeriodoEntity(
      periodo: object.periodo.substring(5, 7) + "/" +object.periodo.substring(2, 4) ,
      valor: object.valor,
    );
  }

  @override
  GastoPeriodoModel convert([json]) {
    return GastoPeriodoModel(
      periodo: json["periodo"] as String,
      valor: json["valor"] as double,
    );
  }

  @override
  Map toJson([GastoPeriodoEntity json]) {
    throw UnimplementedError();
  }

}
