import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project_ref_getx/app/core/enums/resource_title.dart';
import 'package:project_ref_getx/app/core/errors/api_exception.dart';
import 'package:project_ref_getx/app/core/external/mapper/i_mapper.dart';
import 'package:project_ref_getx/app/core/external/provider/api/base_api_provider.dart';
import 'package:project_ref_getx/app/features/responsavel/data/models/responsavel_model.dart';

class ResponsavelApi extends BaseApiProvider<ResponsavelModel> {

  ResponsavelApi(Dio dio, IMapper mapper) : super(dio, mapper);

  @override
  String get baseService => "/responsavel";

  @override
  String get resourceTitle => ResourceTitle.RESPONSAVEL.description;

  Future<Either<ApiException, List<ResponsavelModel>>> list() async {
    return this.getAll(service: baseService);
  }
}
