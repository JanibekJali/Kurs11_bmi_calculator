import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kurs11_bmi_calc/life_cycle_statfull_widget/second_view.dart';

class FirstView extends StatelessWidget {
  FirstView({Key? key}) : super(key: key);
  int san = 0;
  @override
  @override
  Widget build(BuildContext context) {
    log('build First View ===> ');
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              san++;
            },
            child: Icon(Icons.add),
          ),
          Center(
            child: Text(
              'First View',
              style: TextStyle(fontSize: 40),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondView(),
                  ),
                );
              },
              child: Text(
                'Go to next View',
                style: TextStyle(fontSize: 40),
              ))
        ],
      ),
    );
  }
}
