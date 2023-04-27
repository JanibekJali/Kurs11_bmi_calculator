import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kurs11_bmi_calc/constants/colors/app_colors.dart';
import 'package:kurs11_bmi_calc/constants/text_styles/app_text_styles.dart';
import 'package:kurs11_bmi_calc/enums/enum.dart';
import 'package:kurs11_bmi_calc/screens/home_controller.dart';
import 'package:kurs11_bmi_calc/screens/result_screen.dart';
import 'package:kurs11_bmi_calc/widgets/calculate_widget.dart';
import 'package:kurs11_bmi_calc/widgets/genderContainerWidget.dart';
import 'package:kurs11_bmi_calc/widgets/weight_age_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  HomeController homeController = Get.put<HomeController>(HomeController());
  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: homeController.scaffoldKey.value,
      child: Scaffold(
        backgroundColor: const Color(0xff211834),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppColors.secondaryColor,
          title: const Center(
            child: Text(
              'Bmi Calculator',
              style: AppTextStyles.white22w500,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GenderContainerWidget(
                        onTap: () => homeController.enumMaleFemale(Gender.male),
                        icons: FontAwesomeIcons.mars,
                        genderText: 'Male',
                        horizontal: 40,
                        vertical: 40,
                        colors: homeController.maleSelected.value,
                      ),
                      GenderContainerWidget(
                        onTap: () =>
                            homeController.enumMaleFemale(Gender.female),
                        horizontal: 30,
                        vertical: 40,
                        icons: FontAwesomeIcons.venus,
                        genderText: 'FeMale',
                        colors: homeController.femaleSelected.value,
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xff0B0120),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        Text(
                          'Height'.toUpperCase(),
                          style: AppTextStyles.white25w500,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Obx(() => Text(
                                homeController.currentHeightState.value
                                    .toStringAsFixed(0),
                                style: AppTextStyles.white55w800)),
                            Text(
                              'cm',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white.withOpacity(0.8),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                        Obx(() => Slider(
                              activeColor: Colors.white,
                              inactiveColor: Colors.grey,
                              thumbColor: Colors.amber,
                              value: homeController.currentHeightState.value,
                              onChanged: (double userValue) {
                                homeController.currentHeightState.value =
                                    userValue;
                              },
                              max: 220,
                              min: 0,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      WeightAgeWidget(
                        heroTag2: 'tag3',
                        heroTag1: 'tag4',
                        label: 'WeiGht',
                        middleText: '${homeController.weight.value}',
                        onPressedMinus: () {
                          homeController.weight.value--;
                        },
                        onPressedPlus: () {
                          homeController.weight.value++;
                        },
                      ),
                      WeightAgeWidget(
                        heroTag2: 'tag1',
                        heroTag1: 'tag2',
                        label: 'Age',
                        middleText: '${homeController.age.value}',
                        onPressedMinus: () {
                          homeController.ageFunction('-');
                        },
                        onPressedPlus: () => homeController.ageFunction('+'),
                      ),
                    ],
                  )),
            ],
          ),
        ),
        bottomNavigationBar: CalculateWidget(
          labal: 'CalCulaTe',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}
