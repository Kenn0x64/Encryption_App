import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import './widgets/textbox.dart';
import 'package:encrypt/encrypt.dart' as en;

class FS extends StatefulWidget {
  const FS({super.key});

  @override
  State<FS> createState() => EnScreenState();
}

class EnScreenState extends State<FS> {
  String key = "";
  String enText = "";

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
            Textbox(
              vali: (value) {
                if (value!.isEmpty) {
                  return "Key Is Required!";
                }
                return null;
              },
              ro: true,
              name: 'key',
              ht: "Encrytpion Key",
              lt: 'Key',
              minl: 1,
              maxl: 2,
              icon: const Icon(Icons.key),
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
                        _formKey.currentState!.reset();
                      },
                      child: const Text("Reset")),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final key = en.Key.fromUtf8(this.key);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Encrypted Text")));
                          final iv = en.IV.fromLength(16);
                          final encrypter = en.Encrypter(en.AES(key));
                          final encrypted = encrypter.encrypt(
                              _formKey.currentState!.fields['text']!.value,
                              iv: iv);

                          _formKey.currentState!.fields['cipher']!
                              .didChange(encrypted.base64);
                          enText = encrypted.base64;
                          print(encrypted.base64);
                        }
                      },
                      child: const Text("Encrypt")),
                ],
              ),
            ),
             ElevatedButton(
                      onPressed: () {
                        String randomText = base64UrlEncode(List<int>.generate(
                            24, (i) => Random.secure().nextInt(255)));
                            // 22*4
                        key = randomText;
                        _formKey.currentState!.fields['key']!.didChange(key);
                        setState(() {
                          print(randomText.length);
                        });
                      },
                      child: const Text("Genarate Random Key"))
          ],
        ),
      ),
    );
  }
}
