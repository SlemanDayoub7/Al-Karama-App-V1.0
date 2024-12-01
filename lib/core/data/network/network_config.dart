import 'package:al_karama_app/core/enums/request_type.dart';
import 'package:al_karama_app/ui/shared/utils.dart';

class NetworkConfig {
  static Map<String, String> getHeaders(
      {bool? needAuth = false,
      required RequestType type,
      Map<String, String>? extraHeaders}) {
    return {
      if (needAuth!) "Authorization": "Bearer ${storage.getTokenInfo().token}",
      if (type != RequestType.GET) "Content-Type": "application/json",
      if (extraHeaders != null) ...extraHeaders,
      "Accept-Language": storage.getAppLanguage()
    };
  }
}
