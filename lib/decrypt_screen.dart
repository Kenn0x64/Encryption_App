import 'package:encryptapp/widgets/textbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'widgets/drawer.dart';

class SS extends StatefulWidget {
  const SS({super.key});

  @override
  State<SS> createState() => DeScreenState();
}

class DeScreenState extends State<SS> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: drawerBuilder(context),
      body: Container(
      margin: const EdgeInsets.all(35),
      child: FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(27, 13, 15, 15),
              child: const Text("Decrypt",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            ),
            Textbox(
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
              name: 'entext',
              ht: 'Encrypted Text',
              lt: 'Encrypted',
              minl: 3,
              maxl: 5,
              icon: const Icon(Icons.lock),
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
                name: 'text',
                ht: 'Decrypted Text',
                lt: 'Decrypted',
                minl: 3,
                maxl: 5,
                icon: const Icon(Icons.text_fields),
                ro: true,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(25, 25,10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
              ElevatedButton(
                  onPressed: () {
                    _formKey.currentState!.reset();
                  },
                  child: const Text("Reset")),
              ElevatedButton(onPressed: () {
                    setState(() {
                      
                    });
              }, child: const Text("Decrypt")),
                ],
              ),
            )
          ],
        ),
      ),
    ) 
    );
  }
}