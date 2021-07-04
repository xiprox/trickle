// import 'dart:async';

// import 'package:graphql/client.dart';
// import 'package:jwt_decoder/jwt_decoder.dart';
// import 'package:collection/collection.dart';
// import 'package:trickle/data/local/credentials.dart';
// import 'package:trickle/services/services.dart';

// final _kLogTag = '$CustomAuthLink';

// class CustomAuthLink extends Link {
//   final _credentials = get<Credentials>();
//   // final _authRepo = getIt<AuthRepo>();

//   bool _refreshing = false;

//   Future<String?> _getToken(Request request) async {
//     log(_kLogTag, 'Getting access token for new request.');

//     final token = _credentials.accessToken;
//     if (token == null) {
//       log(_kLogTag, 'Token is null. Returning.');
//       return null;
//     }

//     if (JwtDecoder.isExpired(token)) {
//       log(_kLogTag, 'Token has expired. Refreshing.');
//       return await _refreshToken();
//     }

//     log(_kLogTag, 'Success. Returning token.');
//     return token;
//   }

//   Future _refreshToken() async {
//     if (_refreshing) {
//       log(_kLogTag, 'Already refreshing so returning early.');
//       return;
//     }

//     final refreshToken = _credentials.refreshToken;
//     if (refreshToken == null) {
//       log(_kLogTag, 'Refresh token is null. Kicking user out.');
//       await _kickUserOut();
//       return;
//     }

//     _refreshing = true;

//     log(_kLogTag, 'Making refresh request.');
//     final newTokens = await _authRepo.refreshToken(refreshToken);
//     if (newTokens.data != null) {
//       _credentials.accessToken = newTokens.data!.accessToken;
//       _credentials.refreshToken = newTokens.data!.refreshToken;
//       _refreshing = false;
//       log(_kLogTag, 'Refresh successful. New tokens saved. Returning.');
//       return newTokens.data!.accessToken;
//     } else {
//       log(_kLogTag, 'Refresh failed. Kicking user out.');
//       _refreshing = false;
//       await _kickUserOut();
//     }
//   }

//   _kickUserOut() async {
//     await _credentials.clear();

//   }

//   @override
//   Stream<Response> request(Request request, [NextLink? forward]) async* {
//     final token = await _getToken(request);
//     final req = request.updateContextEntry<HttpLinkHeaders>(
//       (headers) => HttpLinkHeaders(
//         headers: {
//           ...headers?.headers ?? <String, String>{},
//           'Authorization': 'Bearer $token',
//         },
//       ),
//     );
//     if (forward != null) {
//       await for (var response in forward(req)) {
//         final statusCode =
//             response.errors?.firstOrNull?.extensions?['exception']?['status'];
//         if (statusCode == 401) {
//           log(_kLogTag, 'Status code 401. Kicking user out.');
//           await _kickUserOut();
//           yield response;
//         } else {
//           yield response;
//         }
//       }
//     }
//   }
// }
