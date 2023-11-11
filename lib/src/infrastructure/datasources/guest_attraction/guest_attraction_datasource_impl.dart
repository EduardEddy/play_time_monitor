import 'package:game_tracker_app/src/domain/datasource/guest_attraction_datasource.dart';
import 'package:game_tracker_app/src/infrastructure/services/http_services.dart';

class GuestAttractionDatasourceImpl extends GuestAttractionDatasource {
  final http = HttpService();
  @override
  Future create({required Map data, required String attraction}) async {
    return http.postMethod(
      body: data,
      endpoint: '/guest-attractions/$attraction',
      headers: {'Accept': 'Application/json'},
    );
  }
}
