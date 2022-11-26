// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:share_plus/share.dart';
import './widgets/textbox.dart';
import './crypto.dart';

class FS extends StatefulWidget {
  const FS({super.key});

  @override
  State<FS> createState() => EnScreenState();
}

class EnScreenState extends State<FS> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(35),
      child: FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(27, 13, 15, 15),
              child: const Text("Encrypt",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            ),
            const Flexible(
              fit: FlexFit.loose,
              child: SizedBox(
                height: 15,
              ),
            ),
            Textbox(
              vali: (value) {
                if (value!.isEmpty) {
                  return "Text Should Not Be Empty";
                }
                return null;
              },
              name: 'text',
              ht: 'Your Text',
              lt: 'Text',
              minl: 3,
              maxl: 5,
              icon: const Icon(Icons.text_fields),
            ),
            const Flexible(
              fit: FlexFit.loose,
              child: SizedBox(
                height: 15,
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Textbox(
                name: 'cipher',
                ht: 'Encrypted Text',
                lt: 'Encrypted',
                minl: 3,
                maxl: 5,
                icon: const Icon(Icons.lock),
                ro: true,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(25, 25, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        EncryptData.encrypted = Encrypted.from64("");
                        _formKey.currentState!.reset();
                      },
                      child: const Text("Reset")),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          EncryptData.encrypt(
                              _formKey.currentState!.fields['text']!.value);

                          _formKey.currentState!.fields['cipher']!
                              .didChange(EncryptData.encrypted!.base64);

                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Encrypted Text")));
                        }
                      },
                      child: const Text("Encrypt")),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            IconButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Share.share(_formKey.currentState!.fields['cipher']!.value);
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Oh Come On!"),
                          content: const Text(
                              "Why Do You Wanna Share Empty Box??\nAre You Okey?"),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Okey?"))
                          ],
                        );
                      },
                    );
                  }
                },
                icon: const Icon(Icons.share))
          ],
        ),
      ),
    );
  }
}
