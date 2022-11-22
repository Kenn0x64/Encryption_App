import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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
            const SizedBox(height: 10,),
            ElevatedButton(
                onPressed: () {
                  EncryptData.genRandomKey();
                  _formKey.currentState!.fields['key']!
                      .didChange(EncryptData.randomkey);
                  setState(() {});
                },
                child: const Text("Genarate Random Key"))
          ],
        ),
      ),
    );
  }
}
