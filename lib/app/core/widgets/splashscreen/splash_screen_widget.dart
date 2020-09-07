import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/external/screen/screen_custom.dart';
import 'package:project_ref_getx/app/core/external/view/base_view.dart';
import 'package:project_ref_getx/app/core/routes/app_routes.dart';
import 'package:project_ref_getx/app/core/widgets/splashscreen/splash_screen_style.dart';

class SplashScreenWidget extends BaseView with SplashScreenStyle{

  @override
  Widget build(BuildContext context) {

    ScreenCustom.init(context);

    Future.delayed(Duration(seconds: 5), (){
      Get.offNamed(AppRoutes.DASHBOARD);
    });

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: colorAccent,
        child: Stack(children: <Widget>[
          Center(
            child: Pulse(
              duration: Duration(milliseconds: 500),
              delay: Duration(seconds: 2),
              child: FadeIn(
                child: BounceInUp(
                  duration: Duration(seconds: 1),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: logoPaddingBotton),
                    child: Image.asset(
                      "assets/images/logo.png",
                      scale: logoSize,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: loadingPaddingTop),
              child: FadeIn(
                delay: Duration(seconds: 3),
                duration: Duration(seconds: 2),
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

}
