import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kurs11_bmi_calc/constants/colors/app_colors.dart';
import 'package:kurs11_bmi_calc/constants/text_styles/app_text_styles.dart';
import 'package:kurs11_bmi_calc/widgets/calculate_widget.dart';
import 'package:kurs11_bmi_calc/widgets/genderContainerWidget.dart';
import 'package:kurs11_bmi_calc/widgets/weight_age_widget.dart';

Color activeColor = AppColors.grey;
Color inactiveColor = AppColors.mainColor;

enum Gender {
  male,
  female,
}

enum Age {
  kosh,
}

class Mashina {
  String bir = 'Lexus';
  String eki = 'Audi';
  String uch = 'Toyota';
  String tort = 'Hyndai';
}

class Adamdar {
  String name1 = 'Kuba';
  String name2 = 'Sagyn';
  String name3 = 'Timur';
}

enum Adam {
  Kuba,
  Sagyn,
  Timur,
}

enum Mashine {
  toyota,
  lexus,
  audi,
  hyndai,
  janibek,
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  double currentHeightState = 60;
  int weight = 65;
  int age = 30;

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: Text("This is my message."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  ageFunction(String ageMP) {
    if (ageMP == '-') {
      age--;
    }
    if (ageMP == '+') {
      age++;
    }
    setState(() {});
  }

  /// primer1
  // void male() {
  //   setState(() {
  //     maleSelected = activeColor;
  //     femaleSelected = inactiveColor;
  //   });
  // }

  // void female() {
  //   setState(() {
  //     femaleSelected = activeColor;
  //     maleSelected = inactiveColor;
  //   });
  // }

  Color maleSelected = inactiveColor;
  Color femaleSelected = inactiveColor;

  /// primer3
  void enumMaleFemale(Gender gender) {
    if (gender == Gender.male) {
      maleSelected = activeColor;
      femaleSelected = inactiveColor;
    } else if (gender == Gender.female) {
      femaleSelected = activeColor;
      maleSelected = inactiveColor;
    }
    setState(() {});
  }

  /// primer2 san menen
  // void maleFamale(int san) {
  //   setState(() {});
  //   if (san == 1) {
  //     maleSelected = activeColor;
  //     femaleSelected = inactiveColor;
  //   }
  //   if (san == 2) {
  //     femaleSelected = activeColor;
  //     maleSelected = inactiveColor;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldKey,
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GenderContainerWidget(
                  onTap: () => enumMaleFemale(Gender.male),
                  icons: FontAwesomeIcons.mars,
                  genderText: 'Male',
                  horizontal: 40,
                  vertical: 40,
                  colors: maleSelected,
                ),
                GenderContainerWidget(
                  onTap: () => enumMaleFemale(Gender.female),
                  horizontal: 30,
                  vertical: 40,
                  icons: FontAwesomeIcons.venus,
                  genderText: 'FeMale',
                  colors: femaleSelected,
                ),
              ],
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
                          Text(currentHeightState.toStringAsFixed(0),
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
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                WeightAgeWidget(
                  heroTag2: 'tag3',
                  heroTag1: 'tag4',
                  label: 'WeiGht',
                  middleText: '$weight',
                  onPressedMinus: () {
                    setState(() {
                      weight--;
                    });
                  },
                  onPressedPlus: () {
                    setState(() {
                      weight++;
                    });
                  },
                ),
                WeightAgeWidget(
                  heroTag2: 'tag1',
                  heroTag1: 'tag2',
                  label: 'Age',
                  middleText: '$age',
                  onPressedMinus: () {
                    ageFunction('-');
                  },
                  onPressedPlus: () => ageFunction('+'),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: CalculateWidget(
          labal: 'CalCulaTe',
          onTap: () {
            Navigator.pushNamed(
              context,
              '/resultScreen',
            );
          },
        ),
      ),
    );
  }
}
