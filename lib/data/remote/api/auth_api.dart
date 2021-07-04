part of '../api.dart';

extension AuthApi on Api {
  String generateAuthUri(String state, String codeChallenge) {
    return Uri.https('accounts.spotify.com', 'authorize', {
      'client_id': spotifyClientId,
      'response_type': 'code',
      'redirect_uri': redirectUrl,
      'code_challenge_method': 'S256',
      'code_challenge': codeChallenge,
      'scope': spotifyScopes,
      'state': state,
    }).toString();
  }

  Future<Resource<AuthResult?>> exchangeCodeForToken(
    String code,
    String codeVerifier,
  ) async {
    final requestBody = {
      'client_id': spotifyClientId,
      'grant_type': 'authorization_code',
      'code': code,
      'code_verifier': codeVerifier,
      'redirect_uri': redirectUrl,
    }.entries.map((entry) => '${entry.key}=${entry.value}').join('&');

    final client = Dio(BaseOptions(responseType: ResponseType.json));
    return ApiCall<AuthResult?>(client)
        .post('https://accounts.spotify.com/api/token')
        .headers({'Content-Type': 'application/x-www-form-urlencoded'})
        .body(requestBody)
        .parseWith(
          (json) =>
              json['access_token'] == null || json['refresh_token'] == null
                  ? null
                  : AuthResult.fromJson(json),
        )
        .future();
  }

  Future<Resource<AuthResult?>> refreshToken() async {
    final credentials = get<Credentials>();

    final requestBody = {
      'client_id': spotifyClientId,
      'grant_type': 'refresh_token',
      'refresh_token': credentials.refreshToken,
    }.entries.map((entry) => '${entry.key}=${entry.value}').join('&');

    final client = Dio(BaseOptions(responseType: ResponseType.json));
    return ApiCall<AuthResult?>(client)
        .post('https://accounts.spotify.com/api/token')
        .headers({'Content-Type': 'application/x-www-form-urlencoded'})
        .body(requestBody)
        .parseWith(
          (json) =>
              json['access_token'] == null || json['refresh_token'] == null
                  ? null
                  : AuthResult.fromJson(json),
        )
        .future();
  }
}
