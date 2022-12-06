// ignore_for_file: camel_case_types

//num1 varies between 30 and 0
//num2 varies between 0 and 10

import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:brain_teaser/functions.dart';

class easymode extends StatefulWidget {
  const easymode({Key? key}) : super(key: key);

  @override
  State<easymode> createState() => _easymode();
}

class _easymode extends State<easymode> {
  int newnum1 = 1;
  int newnum2 = 1;

  void generatenewnumbers() {
    setState(() {
      num1 = Random().nextInt(30);
      num2 = Random().nextInt(10);
    });
  }

  void generatenewoperator() {
    setState(() {
      op = random.nextInt(4);
    });
  }

  void printoperator() {
    setState(() {
      operator = newoperator(op);
    });
  }

  resultupdate() {
    Future.delayed(const Duration(seconds: 3), () {
      result = answer(op);
      setState(() {});
    });
  }

  Timer? timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
        setState(() {
          generatenewnumbers();
          generatenewoperator();
          resultupdate();
          printoperator();
        });
      },
    );
  }

  void cancelTimer() {
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            // Within the SecondRoute widget
            onPressed: () {
              cancelTimer();
              Navigator.pop(context);
            }),
        title: const ListTile(
          minLeadingWidth: 0,
          title: Text(
            'Easy mode',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: const Color(0xff9D8F8F),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topLeft, colors: <Color>[
            Color(0xff395B64),
            Color(0xff40B5AD),
          ]),
        ),
        child: SafeArea(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 60,
                      child: Text(
                        '$num1',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 30,
                      child: Text(
                        '$operator',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 60,
                      child: Text(
                        '$num2',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: const [
                    SizedBox(
                      height: 50,
                      width: 30,
                      child: Text(
                        '=',
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 70,
                      child: Text(
                        '$result',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 35),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
