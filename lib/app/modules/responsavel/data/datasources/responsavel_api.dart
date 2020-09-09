import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project_ref_getx/app/core/enums/resource_title.dart';
import 'package:project_ref_getx/app/core/errors/api_exception.dart';
import 'package:project_ref_getx/app/core/external/provider/api/base_api_provider.dart';
import 'package:project_ref_getx/app/modules/responsavel/data/mapper/responsavel_mapper.dart';
import 'package:project_ref_getx/app/modules/responsavel/data/models/responsavel_model.dart';

class ResponsavelApi extends BaseApiProvider {

  final responsavelMapper = ResponsavelMapper();

  ResponsavelApi(Dio dio) : super(dio);

  @override
  String get baseService => "/responsaveis";

  @override
  String get resourceTitle => ResourceTitle.RESPONSAVEL.description;

  Future<Either<ApiException, List<ResponsavelModel>>> list() async {
    return this.getAll<ResponsavelModel>(service: baseService, iMapper: responsavelMapper);
  }
}
