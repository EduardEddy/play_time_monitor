import 'package:game_tracker_app/src/domain/datasource/guests_datasource.dart';
import 'package:game_tracker_app/src/infrastructure/services/http_services.dart';

class GuestsDatasourcesImpl implements GuestsDatasource {
  final http = HttpService();

  @override
  Future list(int attractionId, int isActive) {
    return http.getMethod(
        '/guest-attractions/$attractionId', {}, {'is_active': isActive});
  }

  @override
  Future remove(String guestAttractionId) {
    return http.deleteMethod(
      endpoint: '/guest-attractions/finished-time/$guestAttractionId',
      headers: {},
    );
  }
}
