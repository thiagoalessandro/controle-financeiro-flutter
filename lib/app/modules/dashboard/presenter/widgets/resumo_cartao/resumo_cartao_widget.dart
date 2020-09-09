import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/external/screen/screen_custom.dart';
import 'package:project_ref_getx/app/core/external/view/base_view.dart';
import 'package:project_ref_getx/app/core/utils/money_utils.dart';
import 'package:project_ref_getx/app/core/widgets/loading/circular_progress/circular_progress.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/entities/resumo_cartao_entity.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/enums/tipo_cartao.dart';
import 'package:project_ref_getx/app/modules/dashboard/presenter/widgets/resumo_cartao/resumo_cartao_style.dart';

class ResumoCartaoWidget extends BaseView with ResumoCartaoStyle {
  final ResumoCartaoEntity resumoCartaoEntity;
  final TipoCartao tipoCartao;

  ResumoCartaoWidget(
      {@required this.resumoCartaoEntity, @required this.tipoCartao});

  @override
  Widget build(BuildContext context) {
    ScreenCustom.init(context);

    return Visibility(
      visible: resumoCartaoEntity != null && resumoCartaoEntity.valorAtual != null,
      replacement: CircularProgress(),
      child: Container(
        width: caclculateWidth(screenWidth),
        child: Card(
          color: colorPrimary,
          elevation: elevation,
          child: Container(
            padding: EdgeInsets.all(paddindAll),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.credit_card,
                      color: colorTextAndIcon,
                      size: fontSizeIcon,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: paddingLeftTextIcon),
                      child: Text(
                        tipoCartao.description,
                        style: TextStyle(
                            color: colorTextAndIcon, fontSize: fontSizeTitle),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: paddingTopDetail),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Valor Atual',
                            style: TextStyle(
                              color: colorTextAndIcon,
                              fontWeight: fontWeightSubtitle,
                              fontSize: fontSizeDetail,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: paddingTopMoney),
                            child: Text(
                              MoneyUtils.getFormatMoneyWithSymbol(
                                  resumoCartaoEntity.valorAtual),
                              style: TextStyle(
                                color: colorTextAndIcon,
                                fontWeight: fontWeightMoney,
                                fontSize: fontSizeDetail,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Projeção',
                            style: TextStyle(
                              color: colorTextAndIcon,
                              fontWeight: fontWeightSubtitle,
                              fontSize: fontSizeDetail,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: paddingTopMoney),
                            child: Text(
                              MoneyUtils.getFormatMoneyWithSymbol(
                                  resumoCartaoEntity.valorProjecao),
                              style: TextStyle(
                                color: colorTextAndIcon,
                                fontWeight: fontWeightMoney,
                                fontSize: fontSizeDetail,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
