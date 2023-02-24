import 'package:flutter/material.dart';
import 'package:kurs11_bmi_calc/constants/colors/app_colors.dart';
import 'package:kurs11_bmi_calc/constants/text_styles/app_text_styles.dart';
import 'package:kurs11_bmi_calc/widgets/calculate_widget.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              child: Column(
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
                  height: size.height * 0.6,
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Нормалдуу',
                        style: AppTextStyles.green30w500,
                      ),
                      Text(
                        '24.5',
                        style: AppTextStyles.white80w500,
                      ),
                      Text(
                        'Сиздин дене салмагыңыз нормалдуу. Азаматсыз!  ',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.white12w500,
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
