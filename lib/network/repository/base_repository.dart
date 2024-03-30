import 'package:pokemon/network/service/api_result.dart';
import 'package:pokemon/network/service/network_exceptions.dart';
import 'package:pokemon/utils/logger.dart';

abstract class BaseRepository {
  late String userLogin;

  ApiResult<T> handleErrorApi<T>(dynamic e,
      {String tag = "", forceLogout = true}) {
    logger.e(tag, e);
    NetworkExceptions exceptions = NetworkExceptions.getDioException(e);
    return ApiResult.failure(error: exceptions);
  }
}
