// ignore_for_file: must_be_immutable

import 'package:encryptapp/main.dart';
import 'package:flutter/material.dart';

class Inhertieddata extends InheritedWidget {
  //Propirties
  //String? enkey;

  @override
  const Inhertieddata({super.key, required App child}) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static Inhertieddata? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Inhertieddata>();
}
