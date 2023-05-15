import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kurs11_bmi_calc/screens/cubit/home_cubit.dart';
import 'package:kurs11_bmi_calc/screens/home_screen.dart';

void main() {
  runApp(const BmiCalculator());
}

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // initialRoute: '/homeScreen',
      home: BlocProvider(
        create: (context) => HomeCubit(),
        child: HomeScreen(),
      ),
      // home: FirstView(),
      // routes: {
      //   '/homeScreen': (context) => HomeScreen(),
      //   '/resultScreen': (context) => ResultScreen(),
      // },
    );
  }
}
