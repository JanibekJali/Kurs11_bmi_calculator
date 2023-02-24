import 'package:flutter/material.dart';
import 'package:kurs11_bmi_calc/constants/colors/app_colors.dart';
import 'package:kurs11_bmi_calc/constants/text_styles/app_text_styles.dart';

class WeightAgeWidget extends StatelessWidget {
  const WeightAgeWidget({
    super.key,
    required this.label,
    required this.middleText,
    required this.onPressedMinus,
    required this.onPressedPlus,
    required this.heroTag1,
    required this.heroTag2,
  });
  final String label;
  final String middleText;
  final void Function() onPressedMinus;
  final void Function() onPressedPlus;
  final Object heroTag1;
  final Object heroTag2;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.mainColor, borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Text(
              label.toUpperCase(),
              style: AppTextStyles.white25w500,
            ),
            Text(
              middleText,
              style: AppTextStyles.white55w800,
            ),
            Row(
              children: [
                FloatingActionButton(
                  heroTag: heroTag1,
                  onPressed: onPressedMinus,
                  child: Icon(
                    Icons.remove,
                    size: 55,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                FloatingActionButton(
                  heroTag: heroTag2,
                  onPressed: onPressedPlus,
                  child: Icon(
                    Icons.add,
                    size: 55,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
