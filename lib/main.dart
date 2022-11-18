import 'package:flutter/material.dart';
import './encrypt_screen.dart';
import 'widgets/drawer.dart';


void main() {
  runApp(const MaterialApp(home:App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(),
            drawer:drawerBuilder(context),
            body: const FS(),);
  }
}
