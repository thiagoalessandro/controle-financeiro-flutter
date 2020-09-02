import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_ref_getx/app/core/constants/notification.dart';
import 'package:project_ref_getx/app/core/environment/env.dart';
import 'package:project_ref_getx/app/core/external/entity/base_entity.dart';
import 'package:project_ref_getx/app/core/external/screen/screen_custom.dart';
import 'package:project_ref_getx/app/core/utils/money_utils.dart';
import 'package:project_ref_getx/app/core/widgets/list_pagination/base_item_list/base_item_list_widget.dart';
import 'package:project_ref_getx/app/features/lembrete/domain/entities/lembrete_entity.dart';
import 'package:project_ref_getx/app/features/lembrete/presenter/widgets/card_item_lembrete/card_item_lembrete_style.dart';

class CardItemLembreteWidget extends BaseItemListWidget<LembreteEntity>
    with CardItemLembreteStyle {

  @override
  Stack stack(LembreteEntity entity, BuildContext context) {
    return Stack(children: <Widget>[
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
          "${MoneyUtils.getFormatMoneyWithSymbol(entity.valor)} em ${DateFormat.yMd().format(entity.dataCompra)}",
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
    ]);
  }

  @override
  String description(LembreteEntity entity) {
    return entity.observacao;
  }
}
