// ignore_for_file: deprecated_member_use
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:al_karama_app/core/services/connectivity_service.dart';
import 'package:al_karama_app/core/data/repository/shared_prefrence_repository.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

bool isEmailValid(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

bool isComplexPassword(String password) {
  RegExp regex = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$&*~]).{8,}$',
  );
  return regex.hasMatch(password);
}

double screenWidth(double percent) {
  BuildContext context = Get.context!;
  if (context.isPortrait)
    return Get.size.width / percent;
  else
    return Get.size.height / percent;
}

double screenHeight(double percent) {
  BuildContext context = Get.context!;
  if (context.isPortrait)
    return Get.size.height / percent;
  else
    return Get.size.width / percent;
}

launchURL(String url) async {
  if (Platform.isIOS) {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false);
    } else {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw';
      }
    }
  } else {
    if (await canLaunch(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

String getImageOfVideo(String value) {
  String url = value, imageUrl, id;
  id = url.substring(url.length - 11);
  imageUrl = 'https://img.youtube.com/vi/${id}/0.jpg';
  return imageUrl;
}

RxBool isRefresh = false.obs;
SharedPrefrenceRepository get storage => Get.find<SharedPrefrenceRepository>();
ConnectivitySerivce get connectivitySerivce => Get.find<ConnectivitySerivce>();
bool isOnline = true;
