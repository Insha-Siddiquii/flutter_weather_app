import 'package:dartz/dartz.dart';

import '../exception/base_exception.dart';
import 'network_client.dart';

abstract class NetworkService {
  Future<Either<HttpResponse, BaseException>> executeRequest(String unit);
}

class NetworkServiceImpl extends NetworkService {
  final NetworkClient _networkClient;

  NetworkServiceImpl(this._networkClient);

  @override
  Future<Either<HttpResponse, BaseException>> executeRequest(
      String unit) async {
    Either<HttpResponse, BaseException> response;
    response = await _networkClient.get(unit);

    return response;
  }
}
