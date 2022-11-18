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
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(35),
      child: FormBuilder(
        onChanged: () {
          if (_formKey.currentState!.validate()) {
            setState(() {});
          }
        },
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
                if (value!.length == 16 ||
                    value.length == 24 ||
                    value.length == 32) {
                  return null;
                }
                return "Key Must Be 16 or 24 or 32 Chars";
              },
              name: 'key',
              ht: 'Your Key',
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
                              vali: (p0) {
                return null;
              },
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
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // final key = en.Key.fromUtf8(
                          //     _formKey.currentState!.fields['key']!.value);

                          // ScaffoldMessenger.of(context)
                          //     .showSnackBar(SnackBar(content: Text("Done")));
                        }
                        // ScaffoldMessenger.of(context)
                        //               .showSnackBar(SnackBar(content: Text("")));

                        //   final iv = en.IV.fromLength(16);

                        //   final encrypter = en.Encrypter(en.AES(key));

                        //   final encrypted = encrypter.encrypt(
                        //       _formKey.currentState!.fields['text']!.value,
                        //       iv: iv);

                        //   print(encrypted.base64);

                        //   setState(() {});
                      },
                      child: const Text("Encrypt")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
