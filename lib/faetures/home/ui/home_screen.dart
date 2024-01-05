import 'package:doc_booker/core/theming/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Hooome'), backgroundColor: ColorManager.mainBlue),
      body: const Center(
        child: Text('THIS IS HOME SCREEN '),
      ),
    );
  }
}
