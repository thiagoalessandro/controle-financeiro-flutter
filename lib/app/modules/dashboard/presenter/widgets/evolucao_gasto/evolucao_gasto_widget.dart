import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/external/screen/screen_custom.dart';
import 'package:project_ref_getx/app/core/external/view/base_view.dart';
import 'package:project_ref_getx/app/core/widgets/loading/circular_progress/circular_progress.dart';
import 'package:project_ref_getx/app/modules/dashboard/presenter/widgets/evolucao_gasto/evolucao_gasto_style.dart';

class EvolucaoGastoWidget extends BaseView with EvolucaoGastoStyle {
  final List<charts.Series> seriesList;

  EvolucaoGastoWidget({@required this.seriesList});

  @override
  Widget build(BuildContext context) {
    ScreenCustom.init(context);

    return Visibility(
      visible: seriesList != null,
      replacement: CircularProgress(),
      child: Card(
        color: colorPrimary,
        elevation: elevation,
        child: Container(
          padding: EdgeInsets.all(paddindAll),
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  'Evolução de Gastos',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSizeTitle,
                  ),
                ),
              ),
              Container(
                height: height,
                child: charts.OrdinalComboChart(
                  seriesList,
                  animate: true,
                  defaultRenderer: charts.LineRendererConfig<String>(),
                  defaultInteractions: true,
                  behaviors: [
                    charts.SelectNearest(),
                    charts.DomainHighlighter(),
                  ],
                  domainAxis: new charts.OrdinalAxisSpec(
                      renderSpec: new charts.SmallTickRendererSpec(

                        // Tick and Label styling here.
                          labelStyle: new charts.TextStyleSpec(
                              fontSize: fontSizeGraph, // size in Pts.
                              color: charts.MaterialPalette.white),

                          // Change the line colors to match text color.
                          lineStyle: new charts.LineStyleSpec(
                              color: charts.MaterialPalette.white))),
                  primaryMeasureAxis: new charts.NumericAxisSpec(
                      renderSpec: new charts.GridlineRendererSpec(

                        // Tick and Label styling here.
                          labelStyle: new charts.TextStyleSpec(
                              fontSize: fontSizeGraph, // size in Pts.
                              color: charts.MaterialPalette.white),

                          // Change the line colors to match text color.
                          lineStyle: new charts.LineStyleSpec(
                              color: charts.MaterialPalette.white))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
