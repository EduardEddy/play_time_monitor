import 'package:game_tracker_app/src/domain/datasource/login_datasource.dart';
import 'package:game_tracker_app/src/infrastructure/services/http_services.dart';

class LoginDatasourceImpl extends LoginDatasource {
  final http = HttpService();
  @override
  Future login({required String email, required String password}) async {
    const String path = '/login';
    return await http.postMethod(
      body: {'email': email, 'password': password},
      endpoint: path,
      headers: {},
    );
  }
}
