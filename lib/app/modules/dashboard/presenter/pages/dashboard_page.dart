import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/external/screen/screen_custom.dart';
import 'package:project_ref_getx/app/core/external/view/base_view_controller.dart';
import 'package:project_ref_getx/app/core/widgets/layout/menu/presenter/widgets/menu_widget.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/enums/tipo_cartao.dart';
import 'package:project_ref_getx/app/modules/dashboard/presenter/controller/dashboard_controller.dart';
import 'package:project_ref_getx/app/modules/dashboard/presenter/pages/dashboard_style.dart';
import 'package:project_ref_getx/app/modules/dashboard/presenter/widgets/card_quantidade_valor/card_quantidade_valor_widget.dart';
import 'package:project_ref_getx/app/modules/dashboard/presenter/widgets/evolucao_gasto/evolucao_gasto_widget.dart';
import 'package:project_ref_getx/app/modules/dashboard/presenter/widgets/resumo_cartao/resumo_cartao_widget.dart';
import 'package:project_ref_getx/app/modules/dashboard/presenter/widgets/topo_dashboard/topo_dashboard_widget.dart';
import 'package:project_ref_getx/app/modules/dashboard/presenter/widgets/total_gasto/total_gasto_widget.dart';

class DashboardPage extends BaseViewController<DashboardController>
    with DashboardStyle {
  @override
  Widget build(BuildContext context) {
    ScreenCustom.init(context);

    return Scaffold(
      backgroundColor: colorAccent,
      body: Center(
        child: Container(
          width: calculateWidth(screenWidth),
          child: Column(
            children: <Widget>[
              TopoDashboardWidget(responsavel: controller.responsavel),
              Container(
                height: calculateHeightDashboard(screenHeight),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Obx(
                        () => EvolucaoGastoWidget(
                          seriesList: controller.listSeries.value,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Obx(
                            () => BounceInLeft(
                              child: ResumoCartaoWidget(
                                resumoCartaoEntity:
                                    controller.resumoCartaoItauGold.value,
                                tipoCartao: TipoCartao.ITAUGOLD,
                              ),
                            ),
                          ),
                          Obx(
                            () => BounceInRight(
                              child: ResumoCartaoWidget(
                                resumoCartaoEntity:
                                    controller.resumoCartaoItauIconta.value,
                                tipoCartao: TipoCartao.ITAUICONTA,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Obx(
                            () => BounceInLeft(
                              child: ResumoCartaoWidget(
                                resumoCartaoEntity:
                                    controller.resumoCartaoNubank.value,
                                tipoCartao: TipoCartao.NUBANK,
                              ),
                            ),
                          ),
                          Obx(
                            () => BounceInRight(
                              child: CardQuantidadeValorWidget(
                                titulo: 'Lembretes',
                                iconData: Icons.add_alert,
                                quantidade: controller.resumoLembrete.value.quantidade,
                                valor: controller.resumoLembrete.value.valor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Obx(
                            () => BounceInLeft(
                              child: CardQuantidadeValorWidget(
                                titulo: 'Assinaturas',
                                iconData: Icons.update,
                                quantidade:
                                    controller.resumoAssinatura.value.quantidade,
                                valor: controller.resumoAssinatura.value.valor,
                              ),
                            ),
                          ),
                          Obx(
                            () => BounceInRight(
                              child: CardQuantidadeValorWidget(
                                titulo: 'Despesas Casa',
                                iconData: Icons.home,
                                quantidade:
                                    controller.resumoDespesaCasa.value.quantidade,
                                valor: controller.resumoDespesaCasa.value.valor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          TotalGastoWidget(
                              valorTotalGasto: 2500.0,
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: calculatePaddingTopMenu(screenHeight)),
                child: Container(
                  height: calculateHeightMenu(screenHeight),
                  child: BounceInRight(child: MenuWidget()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
