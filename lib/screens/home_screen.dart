import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kurs11_bmi_calc/constants/colors/app_colors.dart';
import 'package:kurs11_bmi_calc/constants/text_styles/app_text_styles.dart';
import 'package:kurs11_bmi_calc/enums/enum.dart';
import 'package:kurs11_bmi_calc/screens/cubit/home_cubit.dart';
import 'package:kurs11_bmi_calc/screens/home_controller.dart';
import 'package:kurs11_bmi_calc/screens/result_screen.dart';
import 'package:kurs11_bmi_calc/widgets/calculate_widget.dart';
import 'package:kurs11_bmi_calc/widgets/genderContainerWidget.dart';
import 'package:kurs11_bmi_calc/widgets/weight_age_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  // HomeController homeController = Get.put<HomeController>(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GenderContainerWidget(
                          // onTap: () => homeController.enumMaleFemale(Gender.male),
                          onTap: () => context
                              .read<HomeCubit>()
                              .enumMaleFemale(Gender.male),
                          icons: FontAwesomeIcons.mars,
                          genderText: 'Male',
                          horizontal: 40,
                          vertical: 40,
                          // colors: homeController.maleSelected.value,
                          colors: state.maleSelected!,
                        ),
                        GenderContainerWidget(
                          // onTap: () =>
                          //     homeController.enumMaleFemale(Gender.female),
                          onTap: () => context
                              .read<HomeCubit>()
                              .enumMaleFemale(Gender.female),
                          horizontal: 30,
                          vertical: 40,
                          icons: FontAwesomeIcons.venus,
                          genderText: 'FeMale',
                          // colors: homeController.femaleSelected.value,
                          colors: state.femaleSelected!,
                        ),
                      ],
                    );
                  },
                ),
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
                              Text(state.currentHeightState!.toStringAsFixed(0),
                                  style: AppTextStyles.white55w800),
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
                          Slider(
                            activeColor: Colors.white,
                            inactiveColor: Colors.grey,
                            thumbColor: Colors.amber,
                            value: state.currentHeightState!,
                            onChanged: (double userValue) {
                              context.read<HomeCubit>().sliderChange(userValue);
                              // homeController.currentHeightState.value =
                              //     userValue;
                            },
                            max: 220,
                            min: 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    WeightAgeWidget(
                      heroTag2: 'tag3',
                      heroTag1: 'tag4',
                      label: 'WeiGht',
                      // middleText: '${homeController.weight.value}',
                      middleText: '${state.weight}',
                      onPressedMinus: () {
                        // homeController.weight.value--;
                        context.read<HomeCubit>().weightFunction(false);
                      },
                      onPressedPlus: () {
                        // homeController.weight.value++;
                        context.read<HomeCubit>().weightFunction(true);
                      },
                    ),
                    WeightAgeWidget(
                      heroTag2: 'tag1',
                      heroTag1: 'tag2',
                      label: 'Age',
                      // middleText: '${homeController.age.value}',
                      middleText: '${state.age}',
                      onPressedMinus: () {
                        // homeController.ageFunction('-');
                        context.read<HomeCubit>().ageFunction('-');
                      },
                      onPressedPlus: () =>
                          context.read<HomeCubit>().ageFunction('+'),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: CalculateWidget(
        labal: 'CalCulaTe',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: context.read<HomeCubit>(),
                child: ResultScreen(
                    // height: state.currentHeightState!,
                    // weight: state.weight!,
                    ),
              ),
            ),
          );
        },
      ),
    );
  }
}
