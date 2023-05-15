import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kurs11_bmi_calc/constants/colors/app_colors.dart';
import 'package:kurs11_bmi_calc/constants/text_styles/app_text_styles.dart';
import 'package:kurs11_bmi_calc/data/local_data/bmi_calculator.dart';
import 'package:kurs11_bmi_calc/screens/cubit/home_cubit.dart';
import 'package:kurs11_bmi_calc/screens/home_controller.dart';

import 'package:kurs11_bmi_calc/widgets/calculate_widget.dart';

class ResultScreen extends StatelessWidget {
  // final double height;
  // final int weight;
  const ResultScreen(
      // required this.height,
      // required this.weight,
      );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // double bmi = BmiCalculatorData.calculateBmi(
    //   height: state height,
    //   kg: weight,
    //   // height: homeController.currentHeightState.value,
    //   // kg: homeController.weight.value,
    // );
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                    width: size.width * 0.8,
                    child: Text(
                      'Жыйынтык',
                      style: AppTextStyles.white30w500,
                    ),
                  ),
                  Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            BmiCalculatorData.bmiResult(
                              BmiCalculatorData.calculateBmi(
                                height: state.currentHeightState,
                                kg: state.weight,
                              ),
                            ).toString(),
                            style: AppTextStyles.green30w500,
                          ),
                          Text(
                            BmiCalculatorData.calculateBmi(
                              height: state.currentHeightState,
                              kg: state.weight,
                            ).toStringAsFixed(1),
                            style: AppTextStyles.white80w500,
                          ),
                          Text(
                            BmiCalculatorData.giveDescription(
                                BmiCalculatorData.calculateBmi(
                              height: state.currentHeightState,
                              kg: state.weight,
                            )).toString(),
                            textAlign: TextAlign.center,
                            style: AppTextStyles.white12w500,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          )),
        ),
      ),
      bottomNavigationBar: CalculateWidget(
        labal: 'ReCalCulaTe',
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
