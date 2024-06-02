import 'package:imdb_flutter/domain/entities/token_data.dart';
import 'package:imdb_flutter/domain/repositories/token_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: TokenRepository)
class TokenRepositoryImpl implements TokenRepository {
  @override
  TokenData getToken() {
    const accessToken = '';
    const refreshToken = '';
    return const TokenData(
        accessToken: accessToken, refreshToken: refreshToken);
  }
}
