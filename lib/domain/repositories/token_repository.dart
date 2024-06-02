import 'package:imdb_flutter/domain/entities/token_data.dart';

abstract class TokenRepository{
  TokenData getToken();

  // TODO: we will do later
  /*Future<TokenData> refreshToken(TokenData token);

  Future<void> saveToken(TokenData token);

  Future<void> deleteToken();*/
}