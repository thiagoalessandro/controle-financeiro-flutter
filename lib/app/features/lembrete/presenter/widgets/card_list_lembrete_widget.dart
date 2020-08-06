import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/external/screen/screen_custom.dart';

class CardListLembreteWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    ScreenCustom.init(context);

    return Positioned(
      top: ScreenCustom.screenHeight * .14,
      width: ScreenCustom.screenWidth * 0.95,
      child: Stack(
        children: <Widget>[
          Card(
            child: Container(
              child: Center(
                  child: Text(
                "Formulário",
                style: TextStyle(fontSize: ScreenCustom.fator * 12),
              )),
              width: double.infinity,
              height: ScreenCustom.screenHeight * .71,
            ),
          ),
        ],
      ),
    );
  }
}
