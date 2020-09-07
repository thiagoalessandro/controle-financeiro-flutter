import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/external/screen/screen_custom.dart';
import 'package:project_ref_getx/app/core/external/view/base_view.dart';
import 'package:project_ref_getx/app/core/utils/money_utils.dart';
import 'package:project_ref_getx/app/core/widgets/loading/circular_progress/circular_progress.dart';
import 'package:project_ref_getx/app/modules/dashboard/presenter/widgets/total_gasto/total_gasto_style.dart';

class TotalGastoWidget extends BaseView with TotalGastoStyle {
  final double valorTotalGasto;

  TotalGastoWidget({
    @required this.valorTotalGasto,
  });

  @override
  Widget build(BuildContext context) {
    ScreenCustom.init(context);

    return Visibility(
      visible: valorTotalGasto != null,
      replacement: CircularProgress(),
      child: Expanded(
        child: BounceInUp(
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
                        Icons.trending_down,
                        color: colorTextAndIcon,
                        size: fontSizeIcon,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: paddingLeftTextIcon),
                        child: Text(
                          'Total de Gastos',
                          style: TextStyle(
                              color: colorTextAndIcon, fontSize: fontSizeTitle),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          MoneyUtils.getFormatMoneyWithSymbol(valorTotalGasto),
                          style: TextStyle(
                              color: colorTextAndIcon, fontWeight: fontWeightMoney),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
