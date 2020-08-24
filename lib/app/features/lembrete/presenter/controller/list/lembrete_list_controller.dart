import 'package:project_ref_getx/app/core/external/controller/base_controller.dart';
import 'package:project_ref_getx/app/core/mixins/base_pagination.dart';
import 'package:project_ref_getx/app/features/lembrete/domain/entities/lembrete_entity.dart';
import 'package:project_ref_getx/app/features/lembrete/domain/usecases/lembrete_usecase.dart';

class LembreteListController extends BaseController with BasePagination<LembreteEntity> {

  final LembreteUsecase _lembreteUsecase;

  LembreteListController(this._lembreteUsecase);

  @override
  void onInit() {
    this.init();
  }

  @override
  list() async {
    return await _lembreteUsecase.listLembrete(pageNumber: this.nextNumber, search: this.search.value);
  }

  @override
  void onClose() {
    scrollController.dispose();
  }

  @override
  get title => "Lembrete";

}
