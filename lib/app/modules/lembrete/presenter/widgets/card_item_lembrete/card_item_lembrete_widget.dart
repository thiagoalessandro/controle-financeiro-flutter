import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_ref_getx/app/core/environment/env.dart';
import 'package:project_ref_getx/app/core/utils/money_utils.dart';
import 'package:project_ref_getx/app/core/widgets/list_pagination/base_item_list/base_item_list_widget.dart';
import 'package:project_ref_getx/app/modules/lembrete/domain/entities/lembrete_entity.dart';
import 'package:project_ref_getx/app/modules/lembrete/presenter/widgets/card_item_lembrete/card_item_lembrete_style.dart';

class CardItemLembreteWidget extends BaseItemListWidget<LembreteEntity>
    with CardItemLembreteStyle {

  @override
  ListTile listTile(LembreteEntity entity, BuildContext context) {
    return ListTile(
      title: Text(
        entity.observacao,
        style: TextStyle(
            fontSize: noteTextFontSize,
            color: boxTextColor,
            fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        "${MoneyUtils.getFormatMoneyWithSymbol(entity.valor)} em ${DateFormat.yMd().format(entity.dataCompra)}",
        style: TextStyle(
          fontSize: moneyTextFontSize,
          color: boxTextColor,
        ),
      ),
      leading: Container(
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
    );
  }

  @override
  String description(LembreteEntity entity) {
    return entity.observacao;
  }
}
