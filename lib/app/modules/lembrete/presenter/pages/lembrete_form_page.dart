import 'package:project_ref_getx/app/core/external/view/base_layout_form.dart';
import 'package:project_ref_getx/app/modules/lembrete/presenter/controller/form/lembrete_form_controller.dart';
import 'package:project_ref_getx/app/modules/lembrete/presenter/widgets/form_lembrete/form_lembrete_widget.dart';

class LembreteFormPage extends BaseLayoutForm<LembreteFormController> {

  @override
  formField(LembreteFormController controller) {
    return FormLembreteWidget(controller: controller);
  }

}
