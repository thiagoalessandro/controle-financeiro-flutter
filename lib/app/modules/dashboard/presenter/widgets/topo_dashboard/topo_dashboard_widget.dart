import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/environment/env.dart';
import 'package:project_ref_getx/app/core/external/screen/screen_custom.dart';
import 'package:project_ref_getx/app/core/external/view/base_view.dart';
import 'package:project_ref_getx/app/core/widgets/loading/circular_progress/circular_progress.dart';
import 'package:project_ref_getx/app/modules/dashboard/presenter/widgets/topo_dashboard/topo_dashboard_style.dart';

class TopoDashboardWidget extends BaseView with TopoDashboardStyle {

  final String responsavel;

  TopoDashboardWidget({@required this.responsavel});

  @override
  Widget build(BuildContext context) {

    ScreenCustom.init(context);

    return Visibility(
      visible: responsavel != null,
      replacement: CircularProgress(),
      child: Padding(
        padding: EdgeInsets.only(top: paddingTop, left: paddingSide, right: paddingSide),
        child: Container(
          height: heightTopo,
          width: screenWidth,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        "${environment.baseUrlIcons}/${responsavel.toLowerCase()}.png",
                      ),
                      backgroundColor: colorPrimary,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: paddingLeftReceita),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Receita',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'R\$ 5.604,00',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: fontSizeValor,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Image.asset(
                  "assets/images/logo.png",
                  scale: scaleLogo,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


