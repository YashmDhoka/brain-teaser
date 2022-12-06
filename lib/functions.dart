import 'dart:math';
// import 'package:flutter/material.dart';


addition(num1, num2) {
  int result = num1 + num2;
  return result;
}

subtraction(num1, num2) {
  int result = num1 - num2;
  return result;
}

multiplication(num1, num2) {
  int result = num1 * num2;
  return result;
}

division(num1, num2) {
  var result = num1 / num2;
  return result;
}

var random = Random();

newnum1() {
  var numx = random.nextInt(20);
  return numx;
}

newnum2() {
  var numy = random.nextInt(10);
  return numy;
}

var num1 = newnum1();

var num2 = newnum2();

var result = answer(op);

var op = random.nextInt(4);

answer(op) {
  switch (op) {
    case 0:
      var result = addition(num1, num2);
      return result;

    case 1:
      var result = subtraction(num1, num2);
      return result;

    case 2:
      var result = multiplication(num1, num2);
      return result;

    case 3:
      var result = division(num1, num2);
      return result.toStringAsFixed(1);
  }
}

var operator = newoperator(op);

newoperator(op) {
  switch (op) {
    case 0:
      var operator = '+';
      return operator;

    case 1:
      var operator = '-';
      return operator;

    case 2:
      var operator = '*';
      return operator;

    case 3:
      var operator = '/';
      return operator;
  }
}
