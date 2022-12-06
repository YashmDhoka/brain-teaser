// ignore_for_file: camel_case_types

//num1 varies between 30 and 50
//num2 varies between 5 and 25

import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:brain_teaser/functions.dart';

class mediummode extends StatefulWidget {
  const mediummode({Key? key}) : super(key: key);

  @override
  State<mediummode> createState() => _mediummode();
}

class _mediummode extends State<mediummode> {
  int newnum1 = 1;
  int newnum2 = 1;

  int min = 10;
  int max = 30;

  void generatenewnumbers() {
    setState(() {
      num1 = max + Random().nextInt(max - min);
      num2 = 5 + Random().nextInt(max - min);
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
        {
          setState(() {
            generatenewnumbers();
            generatenewoperator();
            resultupdate();
            printoperator();
          });
        }
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
          title: Text(
            'Medium mode',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.transparent,
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
                SizedBox(
                  height: 50,
                  width: 30,
                  child: Row(
                    children: [
                      Text(
                        '$operator',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
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
                SizedBox(
                  height: 50,
                  width: 30,
                  child: Row(
                    children: const [
                      Text(
                        '=',
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      )
                    ],
                  ),
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
