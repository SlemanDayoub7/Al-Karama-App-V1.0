import 'package:flutter/material.dart';
import 'package:al_karama_app/app/my_app.dart';
import 'package:al_karama_app/app/my_app_controller.dart';
import 'package:al_karama_app/core/services/connectivity_service.dart';
import 'package:al_karama_app/core/data/repository/shared_prefrence_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get.lazyPut(
    () => SharedPrefrenceRepository(),
  );

  await Get.putAsync<SharedPreferences>(
    () async {
      return await SharedPreferences.getInstance();
    },
  );

  Get.put(ConnectivitySerivce());

  await Get.putAsync<MyAppController>(
    () async {
      return await MyAppController();
    },
  );

  runApp(MyApp());
}
