// ignore_for_file: camel_case_types

//num1 varies between 40 and 60
//num2 varies between 20 and 40

import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:brain_teaser/functions.dart';

class difficultmode extends StatefulWidget {
  const difficultmode({Key? key}) : super(key: key);

  @override
  State<difficultmode> createState() => _difficultmode();
}

class _difficultmode extends State<difficultmode> {
  int newnum1 = 1;
  int newnum2 = 1;

  int min = 20;
  int max = 40;

  void generatenewnumbers() {
    setState(() {
      num1 = max + Random().nextInt(max - min);
      num2 = min + Random().nextInt(max - min);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Difficult mode',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        backgroundColor: const Color(0xff9D8F8F),
      ),
      backgroundColor: const Color(0xff9D8F8F),
      body: SafeArea(
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
                        color: Colors.black,
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
                        color: Colors.black,
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
                        color: Colors.black,
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
                        color: Colors.black,
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
                      style: const TextStyle(color: Colors.black, fontSize: 35),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
