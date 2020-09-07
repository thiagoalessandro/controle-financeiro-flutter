import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/external/entity/base_entity.dart';
import 'package:project_ref_getx/app/core/routes/app_routes.dart';
import 'package:project_ref_getx/app/core/widgets/list_pagination/base_item_list/base_item_list_style.dart';

abstract class BaseItemListWidget<T extends BaseEntity> with BaseItemListStyle {
  generate(T entity, Function(T entity) onDelete, BuildContext context) {
    return BounceInUp(
      child: Slidable(
        actionPane: SlidableBehindActionPane(),
        child: Container(
          width: double.infinity,
          height: boxHeigth,
          child: Card(
            elevation: elevationCardMain,
            child: listTile(entity, context),
          ),
        ),
        secondaryActions: <Widget>[
          SlideAction(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(slideBorderRadius),
                color: Color(optionEditColor),
                border: Border.all(
                    color: Color(borderOptionColor), width: borderOptionWidth)),
            onTap: () =>
                Get.offAllNamed(AppRoutes.LEMBRETE_FORM, arguments: entity),
            child: Center(
              child: Icon(
                Icons.edit,
                color: Color(iconOptionColor),
              ),
            ),
          ),
          SlideAction(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(slideBorderRadius),
                color: Color(optionDeleteColor),
                border: Border.all(
                    color: Color(borderOptionColor), width: borderOptionWidth)),
            onTap: () =>
                onConfirmDelete(entity, description(entity), onDelete, context),
            child: Center(
              child: Icon(
                Icons.delete,
                color: Color(iconOptionColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  onConfirmDelete(T entity, String description, Function(T entity) onDelete,
      BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.INFO,
      animType: AnimType.TOPSLIDE,
      title: 'Deseja realmente excluir?',
      desc: 'Item "$description" será excluído...',
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        onDelete(entity);
      },
    )..show();
  }

  listTile(T entity, BuildContext context);

  String description(T entity);
}
