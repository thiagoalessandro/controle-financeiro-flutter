import 'package:project_ref_getx/app/core/external/controller/base_controller.dart';
import 'package:project_ref_getx/app/core/mixins/base_pagination.dart';
import 'package:project_ref_getx/app/features/lembrete/domain/entities/lembrete_entity.dart';
import 'package:project_ref_getx/app/features/lembrete/domain/usecases/lembrete_usecase.dart';

class LembreteController extends BaseController with BasePagination<LembreteEntity> {
  final LembreteUsecase _lembreteUsecase;

  LembreteController(this._lembreteUsecase) {
    this.init();
  }

  @override
  list() async {
    return await _lembreteUsecase.listLembrete(pageNumber: this.nextNumber);
  }

  @override
  void onClose() {
    scrollController.dispose();
  }

}
