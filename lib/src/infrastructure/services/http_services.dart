import 'package:dio/dio.dart';
import 'package:game_tracker_app/src/config/helpers/handle_user_auth.dart';
import 'package:game_tracker_app/src/infrastructure/models/user.dart';

class HttpService {
  final _dio = Dio(BaseOptions(baseUrl: 'http://164.92.80.81/api'));

  Future getMethod(String endpoint, Map<String, dynamic> headers,
      Map<String, dynamic> parameters) async {
    final authUser = await _getAuthToken();
    if (authUser != null) {
      headers = {...headers, ...authUser};
    }
    print(parameters);
    return await _dio.get('$endpoint',
        options: Options(headers: headers), queryParameters: parameters);
  }

  Future postMethod({
    required Object body,
    required String endpoint,
    required Map<String, dynamic> headers,
  }) async {
    final authUser = await _getAuthToken();
    if (authUser != null) {
      headers = {...headers, ...authUser};
    }
    return await _dio.post('/$endpoint',
        data: body, options: Options(headers: headers));
  }

  Future deleteMethod({
    required String endpoint,
    required Map<String, dynamic> headers,
  }) async {
    final authUser = await _getAuthToken();
    if (authUser != null) {
      headers = {...headers, ...authUser};
    }
    return await _dio.delete('/$endpoint', options: Options(headers: headers));
  }

  Future<Map<String, String>?> _getAuthToken() async {
    final userAuth = HandleUserAuth();
    final User? user = await userAuth.getUserAuth();
    if (user != null) {
      return {'Authorization': 'Bearer ${user.token}'};
    }
    return null;
  }
}
