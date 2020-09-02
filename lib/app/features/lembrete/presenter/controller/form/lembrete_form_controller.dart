import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/constants/notification.dart';
import 'package:project_ref_getx/app/core/enums/resource_title.dart';
import 'package:project_ref_getx/app/core/errors/api_exception.dart';
import 'package:project_ref_getx/app/core/external/controller/base_form_controller.dart';
import 'package:project_ref_getx/app/core/routes/app_routes.dart';
import 'package:project_ref_getx/app/core/utils/money_utils.dart';
import 'package:project_ref_getx/app/features/lembrete/domain/entities/lembrete_entity.dart';
import 'package:project_ref_getx/app/features/lembrete/domain/usecases/lembrete_usecase.dart';
import 'package:project_ref_getx/app/features/responsavel/domain/entities/reponsavel_entity.dart';
import 'package:project_ref_getx/app/features/responsavel/domain/usecases/responsavel_usecase.dart';

class LembreteFormController extends BaseFormController<LembreteEntity> {
  final LembreteUsecase _lembreteUsecase;
  final ResponsavelUsecase _responsavelUsecase;

  final listResponsavel = List<ResponsavelEntity>().obs;
  final dataLembrete = DateTime.now().obs;

  LembreteFormController(
    this._lembreteUsecase,
    this._responsavelUsecase,
  ): super();

  @override
  void onInit() {
    super.onInit();
    _loadListReponsavel();
  }

  @override
  String get title => ResourceTitle.LEMBRETE.description;

  _loadListReponsavel() async {
    var result = await _responsavelUsecase.list();
    result.fold(
      (ApiException e) => NotificationCustom.error(e.message.toString()),
      (data) => listResponsavel.value = data,
    );
  }

  @override
  Future<void> onSave() async {
    try {
      if (formKey.currentState.validate()) {
        formKey.currentState.save();
        var result = await _lembreteUsecase.save(lembreteEntity: entity);
        result.fold((exception) => NotificationCustom.error(exception.message),
            (data) => {Get.offAllNamed(AppRoutes.LEMBRETE)});
      } else {
        NotificationCustom.alert("Existem dados inválidos");
      }
    } catch (e) {
      logger.e(e);
      NotificationCustom.alert("Ocorreu um erro ao cadastrar o lembrete");
    }
  }

  @override
  LembreteEntity get instanceEntity => LembreteEntity();

  onSavedObservacao(value) => entity.observacao = value;

  validatorObservacao(value) => value.isEmpty ? 'Campo observação é obrigatório' : null;

  onSavedData(value) => entity.dataCompra = DateTime.parse(value);

  validatorData(value) => value.isEmpty ? 'Campo data é obrigatório' : null;

  onSavedValor(value) => entity.valor = MoneyUtils.getOnlyNumber(value);

  validatorValor(value) =>  value.isEmpty ? 'Campo valor é obrigatório' : null;

  onSavedResponsavel(String value) => entity.responsavel = value;

}
