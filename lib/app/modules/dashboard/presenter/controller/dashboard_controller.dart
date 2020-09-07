import 'package:project_ref_getx/app/core/constants/notification.dart';
import 'package:project_ref_getx/app/core/constants/storage.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:project_ref_getx/app/core/enums/resource_title.dart';
import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/external/controller/base_controller.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/entities/gasto_periodo_entity.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/entities/resumo_cartao_entity.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/entities/resumo_despesa_entity.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/entities/resumo_lembrete_entity.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/enums/categoria_despesa.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/enums/tipo_cartao.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/usecases/dashboard_usecase.dart';

class DashboardController extends BaseController {
  final DashboardUsecase _dashboardUsecase;

  final listSeries = List<charts.Series<GastoPeriodoEntity, String>>().obs;
  final resumoCartaoItauGold = ResumoCartaoEntity().obs;
  final resumoCartaoItauIconta = ResumoCartaoEntity().obs;
  final resumoCartaoNubank = ResumoCartaoEntity().obs;
  final resumoLembrete = ResumoLembreteEntity().obs;
  final resumoDespesaCasa = ResumoDespesaEntity().obs;
  final resumoAssinatura = ResumoDespesaEntity().obs;

  DashboardController(this._dashboardUsecase) {
    loadDataGraph();
    loadResumoCartao(TipoCartao.ITAUGOLD);
    loadResumoCartao(TipoCartao.ITAUICONTA);
    loadResumoCartao(TipoCartao.NUBANK);
    loadResumoLembrete();
    loadResumoDespesaCasa();
    loadResumoAssinatura();
  }

  loadDataGraph() async {
    var result = await _dashboardUsecase.gastoGeralPeriodo(responsavel: responsavel);
    result.fold(
        (exception) => NotificationCustom.error(
            "Não foi possível buscar despesas por período"),
        (data) => {
              listSeries.value = [
                charts.Series<GastoPeriodoEntity, String>(
                    id: "Despesas",
                    colorFn: (_, __) => charts.MaterialPalette.white,
                    domainFn: (GastoPeriodoEntity gasto, _) => gasto.periodo,
                    measureFn: (GastoPeriodoEntity despesa, _) => despesa.valor,
                    data: data)
              ]
            });
  }

  loadResumoCartao(TipoCartao tipoCartao) async {
    var result = await _dashboardUsecase.resumoCartaoByTipo(tipoCartao: tipoCartao);
    result.fold(
        (exception) => NotificationCustom.error("Não foi possível buscar resumo cartão ${tipoCartao.description}"),
        (data) => setDataCartao(tipoCartao, data),
    );
  }


  loadResumoLembrete() async {
    var result = await _dashboardUsecase.resumoLembrete();
    result.fold(
          (exception) => NotificationCustom.error("Não foi possível buscar resumo dos lembretes"),
          (data) => resumoLembrete.value = data,
    );
  }

  loadResumoDespesaCasa() async {
    var result = await _dashboardUsecase.resumoDespesaByCategoria(categoriaDespesa: CategoriaDespesa.DESPESA_CASA);
    result.fold(
          (exception) => NotificationCustom.error("Não foi possível buscar resumo das despesas da casa"),
          (data) => resumoDespesaCasa.value = data,
    );
  }

  loadResumoAssinatura() async {
    var result = await _dashboardUsecase.resumoDespesaByCategoria(categoriaDespesa: CategoriaDespesa.ASSINATURA);
    result.fold(
          (exception) => NotificationCustom.error("Não foi possível buscar resumo das assinaturas"),
          (data) => resumoAssinatura.value = data,
    );
  }

  setDataCartao(TipoCartao tipoCartao, ResumoCartaoEntity resumoCartaoEntity) {
    switch (tipoCartao) {
      case TipoCartao.ITAUGOLD:
        resumoCartaoItauGold.value = resumoCartaoEntity;
        break;
      case TipoCartao.ITAUICONTA:
        resumoCartaoItauIconta.value = resumoCartaoEntity;
        break;
      case TipoCartao.NUBANK:
        resumoCartaoNubank.value = resumoCartaoEntity;
        break;
    }
  }

  String get responsavel => StorageCustom.get<String>("responsavel");

  @override
  String get title => ResourceTitle.DASHBOARD.description;

}
