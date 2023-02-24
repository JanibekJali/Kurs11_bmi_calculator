import 'package:flutter/material.dart';
import 'package:kurs11_bmi_calc/constants/colors/app_colors.dart';
import 'package:kurs11_bmi_calc/constants/text_styles/app_text_styles.dart';

class CalculateWidget extends StatelessWidget {
  const CalculateWidget({
    super.key,
    required this.labal,
    this.onTap,
  });
  final String labal;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: AppColors.indigo,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            labal.toUpperCase(),
            textAlign: TextAlign.center,
            style: AppTextStyles.white40w800,
          ),
        ),
      ),
    );
  }
}
