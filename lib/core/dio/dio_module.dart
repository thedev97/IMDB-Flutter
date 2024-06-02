import 'package:dio/dio.dart';
import 'package:imdb_flutter/core/dio/app_interceptor.dart';
import 'package:imdb_flutter/domain/repositories/token_repository.dart';
import 'package:injectable/injectable.dart';

const _baseURL = "";
const _requestTimeOutInSeconds = Duration(seconds: 5);

@module
abstract class DioModule{
  Dio getAuthorized(TokenRepository repository){
    final dioClient = _dioClient();
    dioClient.interceptors.addAll([
      AuthorizedRequestInterceptor(repository)
    ]);
    return dioClient;
  }

  Dio getUnauthorized(){
    final dioClient = _dioClient();
    dioClient.interceptors.addAll([
      UnauthorizedRequestInterceptor()
    ]);
    return dioClient;
  }

  Dio _dioClient(){
    final baseOptions = BaseOptions(
      baseUrl: _baseURL,
      receiveDataWhenStatusError: true,
      connectTimeout: _requestTimeOutInSeconds,
      receiveTimeout: _requestTimeOutInSeconds
    );
    return Dio(baseOptions);
  }
}