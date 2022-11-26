import 'package:encryptapp/decrypt_screen.dart';
import 'package:flutter/material.dart';
import './encrypt_screen.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: App(),
  ));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int index = 0;
  List<Widget> screen = [const FS(), const SS()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.key), label: "Encrypt"),
            BottomNavigationBarItem(
                icon: Icon(Icons.lock_open), label: "Dncrypt")
          ],
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
        ),
        appBar: AppBar(),
        // drawer: drawerBuilder(context),
        body: IndexedStack(
          index: index,
          children: screen,
        ));
  }
}
