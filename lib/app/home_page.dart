import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tap_button/app/tap_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Academia do Flutter'),
        centerTitle: true,
      ),
      body: Center(
        child: TapButton(
          duration: const Duration(milliseconds: 100),
          text: 'Tap Me',
          pulsePx: 20,
          onTap: () => log('Cliquei no botão!'),
        ),
      ),
    );
  }
}
