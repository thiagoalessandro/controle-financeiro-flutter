import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_ref_getx/app/core/environment/env.dart';
import 'package:project_ref_getx/app/core/external/screen/screen_custom.dart';
import 'package:project_ref_getx/app/core/widgets/list_pagination/base_item_widget.dart';
import 'package:project_ref_getx/app/features/lembrete/domain/entities/lembrete_entity.dart';
import 'package:project_ref_getx/app/features/lembrete/presenter/widgets/card_item_lembrete_style.dart';

class CardItemLembreteWidget extends BaseItemWidget<LembreteEntity>
    with CardItemLembreteStyle {

  @override
  generate(LembreteEntity entity) {
    ScreenCustom.init(Get.context);
    return BounceInUp(
      child: Container(
        width: double.infinity,
        height: boxHeigth,
        child: GestureDetector(
          onTap: () => Get.rawSnackbar(
              title: "Visualização", message: entity.observacao),
          child: Card(
            elevation: 1.5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: <Widget>[
                  Container(
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          "${environment.baseUrlIcons}/${entity.responsavel.toLowerCase()}.png",
                        ),
                        backgroundColor: Theme.of(Get.context).primaryColor,
                      ),
                      width: responsibleImageWidth,
                      height: responsibleImageHeigth,
                      padding: const EdgeInsets.all(1.3),
                      decoration: new BoxDecoration(
                        color: responsibleColor(entity.responsavel),
                        // border color
                        shape: BoxShape.circle,
                      )),
                  Padding(
                    padding: EdgeInsets.only(
                      left: noteTextLeft,
                      top: noteTextTop,
                    ),
                    child: Text(
                      entity.observacao,
                      style: TextStyle(
                          fontSize: noteTextFontSize,
                          color: boxTextColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: moneyTextLeft,
                      top: moneyTextTop,
                    ),
                    child: Text(
                      "R\$ ${NumberFormat("#,##0.00").format(entity.valor)} em ${DateFormat.yMd().format(entity.dataCompra)}",
                      style: TextStyle(
                        fontSize: moneyTextFontSize,
                        color: boxTextColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: responsibleNameLeft,
                      top: responsibleNameTop,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.assistant_photo,
                        color: Colors.white,
                      ),
                    ),
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
