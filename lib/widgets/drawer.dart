import 'package:encryptapp/decrypt_screen.dart';
import 'package:encryptapp/main.dart';
import 'package:flutter/material.dart';


Drawer drawerBuilder(
  BuildContext context,
) {

  return Drawer(
    child: ListView(
      children: [
         DrawerHeader(
            decoration: const BoxDecoration(color: Colors.orange), child:Container(
              padding: const EdgeInsets.fromLTRB(10, 25, 0, 0),
              child:const Text("Cryptography\nApp",style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),)
               ,)),
        ListTile(
            leading: const Icon(Icons.key),
            title: const Text("Encrypt"),
            onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const App(),
                ))),
        ListTile(
          leading: const Icon(Icons.lock_open),
          title: const Text("Decrypt"),
          onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SS(),
              )),
        ),
      ],
    ),
  );
}
