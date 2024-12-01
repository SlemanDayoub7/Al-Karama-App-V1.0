import 'package:al_karama_app/core/data/models/news_model.dart';
import 'package:al_karama_app/core/data/models/next_match_model.dart';
import 'package:al_karama_app/core/data/models/player_detail_model.dart';
import 'package:al_karama_app/core/data/models/sports_model.dart';
import 'package:al_karama_app/core/data/repository/news_repository.dart';
import 'package:al_karama_app/core/data/repository/next_match_repository.dart';
import 'package:al_karama_app/core/data/repository/sports_repository.dart';
import 'package:al_karama_app/core/data/repository/stuff_repository.dart';
import 'package:al_karama_app/ui/shared/utils.dart';
import 'package:al_karama_app/ui/views/details_news_view/details_news_view.dart';
import 'package:get/get.dart';
import '../../../../core/translation/app_translation.dart';
import '../../shared/custom_widgets/custom_toast.dart';

class PlayerController extends GetxController {
  RxBool isLoading = true.obs;
  bool haveWrong = false;
  String playerId = '';
  Rx<PlayerDetailModel> playerDetail = PlayerDetailModel().obs;
  PlayerController({required this.playerId});
  @override
  void onInit() async {
    //   playerDetail.value = PlayerDetailModel(
    //       image:
    //           "https://www.kindpng.com/picc/m/706-7068985_cristiano-ronaldo-free-png-image-cristiano-ronaldo-png.png",
    //       name: "كريستيانو رونالدو",
    //       born: "1985",
    //       high: '187',
    //       number: '7',
    //       play: "مهاجم",
    //       career: '''
    // سبورتينغ لشبونة (2002-2003):
    // بدأ رونالدو مسيرته الاحترافية في سبورتينغ لشبونة، حيث جذب انتباه الأندية الأوروبية الكبرى.

    // مانشستر يونايتد (2003-2009):
    // انتقل إلى مانشستر يونايتد، حيث حقق نجاحات كبيرة، بما في ذلك الفوز بدوري أبطال أوروبا والدوري الإنجليزي الممتاز.

    // ريال مدريد (2009-2018):
    // انتقل إلى ريال مدريد في صفقة قياسية، حيث أصبح الهداف التاريخي للنادي وفاز بالعديد من البطولات، بما في ذلك أربع مرات دوري أبطال أوروبا.

    // يوفنتوس (2018-2021):
    // انتقل إلى يوفنتوس، حيث استمر في تحقيق النجاحات والفوز بالألقاب.

    // مانشستر يونايتد (2021-2022):
    // عاد إلى مانشستر يونايتد لفترة ثانية، حيث ساهم بخبرته ومهاراته.

    // النصر السعودي (2023-حتى الآن):
    // انضم إلى نادي النصر السعودي، حيث يستمر في ممارسة كرة القدم على مستوى عالٍ.

    // الإنجازات الفردية والجماعية:
    // - فاز بجائزة الكرة الذهبية عدة مرات.
    // - حصل على لقب أفضل لاعب في العالم من الفيفا.
    // - سجل أكثر من 800 هدف في مسيرته الاحترافية.

    // كريستيانو رونالدو لا يزال يلعب ويؤثر في عالم كرة القدم، مما يجعله رمزًا للنجاح والتفاني في الرياضة.
    // ''');
    await getData();
    super.onInit();
  }

  getData() async {
    if (!isOnline) {
      CustomToast.showMeassge(message: tr("key_no_internet"));
      return;
    }

    isLoading.value = true;
    playerDetail.value = PlayerDetailModel();
    await StuffRepository().getPlayerDetail(playerId).then(
      (value) {
        value.fold(
            (l) => CustomToast.showMeassge(message: tr("key_some_thing_wrong")),
            (r) => playerDetail.value = r);
      },
    );

    isLoading.value = haveWrong = false;
  }
}
