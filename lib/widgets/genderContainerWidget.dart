import 'package:flutter/material.dart';
import 'package:kurs11_bmi_calc/constants/colors/app_colors.dart';

class GenderContainerWidget extends StatelessWidget {
  const GenderContainerWidget({
    super.key,
    required this.genderText,
    required this.icons,
  });
  final IconData icons;
  final String genderText;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff0B0120),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Icon(
              icons,
              size: 80,
              color: Colors.white,
            ),
            Text(
              genderText.toUpperCase(),
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: AppColors.white.withOpacity(0.8),
              ),
            )
          ],
        ),
      ),
    );
  }
}
