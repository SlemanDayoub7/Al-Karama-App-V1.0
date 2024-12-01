import 'package:al_karama_app/core/translation/languages/ar_language.dart';
import 'package:al_karama_app/core/translation/languages/en_language.dart';
import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": ENLanguage.map,
        "ar_SA": ARLanguage.map,
      };
}

tr(String key) => key.tr;
