import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/constants/notification.dart';
import 'package:project_ref_getx/app/core/enums/resource_title.dart';
import 'package:project_ref_getx/app/core/errors/api_exception.dart';
import 'package:project_ref_getx/app/core/external/controller/base_list_controller.dart';
import 'package:project_ref_getx/app/core/routes/app_routes.dart';
import 'package:project_ref_getx/app/features/lembrete/domain/entities/lembrete_entity.dart';
import 'package:project_ref_getx/app/features/lembrete/domain/usecases/lembrete_usecase.dart';

class LembreteListController extends BaseListController<LembreteEntity> {
  final LembreteUsecase _lembreteUsecase;

  LembreteListController(this._lembreteUsecase);

  @override
  void onInit() {
    this.init();
  }

  @override
  list() async {
    return await _lembreteUsecase.listLembrete(
        pageNumber: this.nextNumber, search: this.search.value);
  }

  @override
  void onClose() {
    scrollController.dispose();
  }

  @override
  String get title => ResourceTitle.LEMBRETE.description;

  @override
  String get formRouter => AppRoutes.LEMBRETE_FORM;

  @override
  Future<Either<ApiException, bool>> onDeleteByEntity(LembreteEntity entity) async {
    return await _lembreteUsecase.deleteById(id: entity.id);
  }
}
