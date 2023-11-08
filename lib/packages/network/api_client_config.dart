// Project imports:
import 'app/api_client/api_client.dart';
import 'app/api_client/app_client.dart';

class APIClientConfig {
  static AppClient getAppAPI() {
    return AppAPIClient();
  }
}
