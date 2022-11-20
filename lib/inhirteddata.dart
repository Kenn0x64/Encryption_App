// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as en;

class Inhertieddata extends InheritedWidget {
  String? enkey;
  late en.Encrypted enText;
  @override
  // ignore: overridden_fields
  Widget child;
  late en.Encrypter encrypter;
late  en.IV iv;

  Inhertieddata({super.key, required this.child}) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static Inhertieddata? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Inhertieddata>();
}
