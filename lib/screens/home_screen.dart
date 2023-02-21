import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kurs11_bmi_calc/constants/colors/app_colors.dart';
import 'package:kurs11_bmi_calc/constants/text_styles/app_text_styles.dart';
import 'package:kurs11_bmi_calc/widgets/genderContainerWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double currentHeightState = 60;
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
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GenderContainerWidget(
                  icons: FontAwesomeIcons.mars,
                  genderText: 'Male',
                ),
                GenderContainerWidget(
                  icons: FontAwesomeIcons.venus,
                  genderText: 'FeMale',
                ),
              ],
            ),
            Container(
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
                        Text(
                          currentHeightState.toStringAsFixed(0),
                          style: TextStyle(
                            fontSize: 55,
                            color: AppColors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          'cm',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: AppColors.newwhite.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      activeColor: Colors.white,
                      inactiveColor: Colors.grey,
                      thumbColor: Colors.amber,
                      value: currentHeightState,
                      onChanged: (double userValue) {
                        setState(() {});
                        currentHeightState = userValue;
                      },
                      max: 220,
                      min: 0,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
