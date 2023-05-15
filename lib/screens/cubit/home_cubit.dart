import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kurs11_bmi_calc/constants/colors/app_colors.dart';
import 'package:kurs11_bmi_calc/enums/enum.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(HomeState(
          age: 30,
          weight: 60,
          currentHeightState: 130,
          maleSelected: AppColors.inactiveColor,
          femaleSelected: AppColors.inactiveColor,
        ));

  void enumMaleFemale(Gender gender) {
    switch (gender) {
      case Gender.male:
        emit(state.copyWith(
            maleSelected: AppColors.activeColor,
            femaleSelected: AppColors.inactiveColor));

        break;
      case Gender.female:
        emit(state.copyWith(
            femaleSelected: AppColors.activeColor,
            maleSelected: AppColors.inactiveColor));
        break;
      default:
        null;
      // Gender.none;
    }
    // if (gender == Gender.male) {
    //   emit(state.copyWith(
    //       maleSelected: AppColors.activeColor,
    //       femaleSelected: AppColors.inactiveColor));
    // }
    // if (gender == Gender.female) {
    //   emit(state.copyWith(
    //       femaleSelected: AppColors.activeColor,
    //       maleSelected: AppColors.inactiveColor));
    // }
  }

  void sliderChange(double value) {
    emit(state.copyWith(currentHeightState: value));
  }

  void ageFunction(String ageMP) {
    if (ageMP == '-') {
      emit(state.copyWith(age: state.age! - 1));
    }
    if (ageMP == '+') {
      emit(state.copyWith(age: state.age! + 1));
    }
  }

  void weightFunction(bool weight) {
    if (weight == true) {
      emit(
        state.copyWith(weight: state.weight! + 1),
      );
    }
    if (weight == false) {
      emit(
        state.copyWith(weight: state.weight! - 1),
      );
    }
  }
}
