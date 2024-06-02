import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:imdb_flutter/domain/entities/token_data.dart';
import 'package:imdb_flutter/domain/repositories/token_repository.dart';

const _baseHeaders = {
  'Content-Type': 'application/json',
  'charset': 'utf-8'
};

class UnauthorizedRequestInterceptor extends QueuedInterceptor{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll(_baseHeaders);
    log('${options.method} >>> ${options.uri}');
    log('Query parameters: ${options.queryParameters}');
    log('Request data: ${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('${response.requestOptions.method} <<< ${response.requestOptions.uri}');
    log('Response data ${response.requestOptions.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('${err.requestOptions.method} <<< ${err.requestOptions.uri}');
    log('Error : ${err.requestOptions.data}');
    handler.next(err);
  }
}

class AuthorizedRequestInterceptor extends UnauthorizedRequestInterceptor{

  AuthorizedRequestInterceptor(this._tokenRepository);

  final TokenRepository _tokenRepository;

  TokenData get _tokenData => _tokenRepository.getToken();

  String get _bearerToken => 'Bearer ${_tokenData.accessToken}';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    try{
      options.headers[HttpHeaders.authorizationHeader] = _bearerToken;
      super.onRequest(options, handler);
    }on DioException catch(e){
      handler.reject(e);
    }on Object catch(e){
      log(e.toString());
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if(err.response?.statusCode == HttpStatus.unauthorized){
      // TODO: refresh token initialized when access token expired.
    }else {
      super.onError(err, handler);
    }
  }
}