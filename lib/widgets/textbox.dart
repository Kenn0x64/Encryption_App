// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Textbox extends StatelessWidget {
  String? Function(String?)? vali;
  String name;
  String ht;
  String lt;
  int minl;
  int ct=0;
  int maxl;
  Icon icon;
  int? wed;
  bool ro;

  Textbox(
      {super.key,
      this.vali,
      required this.name,
      required this.minl,
      required this.maxl,
      required this.ht,
      required this.lt,
      required this.icon,
      this.ro = false,
      this.wed});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return SizedBox(
            width: 300,
            child: FormBuilderTextField(
                validator: vali,
                onChanged: (value) {
                  setState(() {
                    ct = value!.length;
                  });
                },
                readOnly: ro,
                name: name,
                minLines: minl,
                maxLines: maxl,
                decoration: InputDecoration(
                    counterText: ct.toString() ,
                    icon: icon,
                    labelText: lt,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    hintText: ht)));
      },
    );
  }
}
