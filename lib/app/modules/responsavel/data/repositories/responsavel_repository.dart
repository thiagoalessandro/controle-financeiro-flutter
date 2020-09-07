import 'package:dartz/dartz.dart';
import 'package:project_ref_getx/app/core/errors/api_exception.dart';
import 'package:project_ref_getx/app/core/external/repositories/base_repository.dart';
import 'package:project_ref_getx/app/modules/responsavel/data/datasources/responsavel_api.dart';
import 'package:project_ref_getx/app/modules/responsavel/data/mapper/responsavel_mapper.dart';
import 'package:project_ref_getx/app/modules/responsavel/domain/entities/reponsavel_entity.dart';
import 'package:project_ref_getx/app/modules/responsavel/domain/repositories/i_responsavel_repository.dart';

class ResponsavelRepository extends BaseRepository
    implements IResponsavelRepository {
  final ResponsavelMapper _mapper;
  final ResponsavelApi _responsavelApi;

  ResponsavelRepository(
    this._responsavelApi,
    this._mapper,
  );

  @override
  Future<Either<ApiException, List<ResponsavelEntity>>> list() async {
    var list = List<ResponsavelEntity>();
    try {
      var result = await _responsavelApi.list();
      result.fold(
          (l) => throw l,
          (r) => {
                list = r.map((dto) => _mapper.from(dto)).toList(),
              });
      return right(list);
    } catch (e) {
      logger.e(e);
      return left(e);
    }
  }
}
