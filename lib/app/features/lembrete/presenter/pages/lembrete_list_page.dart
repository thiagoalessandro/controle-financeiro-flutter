import 'package:project_ref_getx/app/core/external/view/base_layout_list.dart';
import 'package:project_ref_getx/app/core/widgets/list_pagination/base_item_list/base_item_list_widget.dart';
import 'package:project_ref_getx/app/features/lembrete/presenter/controller/list/lembrete_list_controller.dart';
import 'package:project_ref_getx/app/features/lembrete/presenter/widgets/card_item_lembrete/card_item_lembrete_widget.dart';

class LembreteListPage extends BaseLayoutList<LembreteListController> {

  @override
  BaseItemListWidget get cardItemWidget => CardItemLembreteWidget();

}
