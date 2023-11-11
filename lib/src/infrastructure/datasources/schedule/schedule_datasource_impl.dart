import 'package:game_tracker_app/src/domain/datasource/schedule_datasource.dart';
import 'package:game_tracker_app/src/infrastructure/services/http_services.dart';

class ScheduleDatasourceImpl extends ScheduleDatasource {
  final http = HttpService();

  @override
  Future list(String attraction) {
    return http.getMethod('/price-attractions/$attraction', {}, {});
  }
}
