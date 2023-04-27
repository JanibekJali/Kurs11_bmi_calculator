import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kurs11_bmi_calc/constants/colors/app_colors.dart';
import 'package:kurs11_bmi_calc/enums/enum.dart';

HomeController homeController = Get.find<HomeController>();
//   final homeController=  Get.lazyPut(()=>HomeController());

class HomeController extends GetxController {
  RxDouble currentHeightState = 60.0.obs;
  RxInt weight = 65.obs;
  Rx<int> age = 30.obs;
  Rx<Color> maleSelected = AppColors.inactiveColor.obs;
  Rx<Color> femaleSelected = AppColors.inactiveColor.obs;
  final Rx<GlobalKey<ScaffoldMessengerState>> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>().obs;

  ageFunction(String ageMP) {
    if (ageMP == '-') {
      age.value--;
    }
    if (ageMP == '+') {
      age.value++;
    }
  }

  void enumMaleFemale(Gender gender) {
    if (gender == Gender.male) {
      maleSelected.value = AppColors.activeColor;
      femaleSelected.value = AppColors.inactiveColor;
    } else if (gender == Gender.female) {
      femaleSelected.value = AppColors.activeColor;
      maleSelected.value = AppColors.inactiveColor;
    }
  }
}
