import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SecondView extends StatefulWidget {
  const SecondView({Key? key}) : super(key: key);

  @override
  State<SecondView> createState() {
    log('createState ======> ');
    return _SecondViewState();
  }
}

class _SecondViewState extends State<SecondView> {
  int san = 0;
  String? text;
  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  kosh() {
    setState(() {
      san++;
    });
    log('setState ===>');
  }

  @override
  void initState() {
    log('initState =====>');
    getText();
    log('getTextInitState ====>');
    SchedulerBinding.instance.addPostFrameCallback((_) {
      showMyDialog();
    });
    super.initState();
  }

  @override
  void dispose() {
    log('dispose');

    super.dispose();
  }

  Future<void> getText() async {
    await Future(
      () => Future.delayed(Duration(seconds: 4), () {
        text = 'Text 4 secunddan kiyin keldi';
        setState(() {});
        log('getTextFuture====>');
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    log('build ====> $san');
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              text ?? 'Text joldo kele jatat',
              style: TextStyle(fontSize: 40),
            ),
          ),
          SizedBox(
            height: 140,
          ),
          ElevatedButton(
            onPressed: kosh,
            child: Icon(Icons.add),
          ),
          Center(
            child: Text(
              'Second View: $san',
              style: TextStyle(fontSize: 40),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Go back to First View',
              style: TextStyle(fontSize: 40),
            ),
          ),
        ],
      ),
    );
  }
}
