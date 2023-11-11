import 'package:game_tracker_app/src/domain/datasource/game_datasource.dart';
import 'package:game_tracker_app/src/infrastructure/services/http_services.dart';

class GameDataSourcesImpl extends GameDatasource {
  final http = HttpService();

  @override
  Future list() async {
    return await http.getMethod('/attractions', {}, {});
  }
}
