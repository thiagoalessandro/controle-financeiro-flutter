import 'dart:async';

import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/external/view/base_view.dart';

class ButtonSaveForm extends BaseView {
  final Function() onSave;

  ButtonSaveForm({@required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ArgonButton(
        height: 50,
        width: 150,
        color: Get.theme.accentColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.save,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                "Salvar",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
        loader: Container(
          padding: EdgeInsets.all(10),
          child: SpinKitRotatingCircle(
            color: Colors.white,
            // size: loaderWidth ,
          ),
        ),
        onTap: (startLoading, stopLoading, btnState) {
          startLoading();
          Timer(Duration(seconds: 2), () {
              onSave();
              stopLoading();
          });
        },
      ),
    );
  }
}
