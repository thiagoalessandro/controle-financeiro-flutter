import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/external/screen/screen_custom.dart';
import 'package:project_ref_getx/app/core/external/view/base_view.dart';
import 'package:project_ref_getx/app/core/utils/money_utils.dart';
import 'package:project_ref_getx/app/core/widgets/loading/circular_progress/circular_progress.dart';
import 'package:project_ref_getx/app/modules/dashboard/presenter/widgets/card_quantidade_valor/card_quantidade_valor_style.dart';

class CardQuantidadeValorWidget extends BaseView with CardQuantidadeValorStyle {
  final IconData iconData;
  final String titulo;
  final double valor;
  final int quantidade;

  CardQuantidadeValorWidget({
    @required this.iconData,
    @required this.titulo,
    @required this.valor,
    @required this.quantidade,
  });

  @override
  Widget build(BuildContext context) {
    ScreenCustom.init(context);

    return Visibility(
      visible: valor != null,
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
                      iconData,
                      color: colorTextAndIcon,
                      size: fontSizeIcon,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: paddingLeftTextIcon),
                      child: Text(
                        titulo,
                        style: TextStyle(
                          color: colorTextAndIcon,
                          fontSize: fontSizeTitle,
                        ),
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
                            'Qtde.',
                            style: TextStyle(
                              color: colorTextAndIcon,
                              fontWeight: fontWeightSubtitle,
                              fontSize: fontSizeDetail,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: paddingTopMoney),
                            child: Text(
                              '$quantidade',
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
                            'Valor',
                            style: TextStyle(
                              color: colorTextAndIcon,
                              fontWeight: fontWeightSubtitle,
                              fontSize: fontSizeDetail,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: paddingTopMoney),
                            child: Text(
                              MoneyUtils.getFormatMoneyWithSymbol(valor),
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
