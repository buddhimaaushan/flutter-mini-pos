import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MiniPosApp());
}

class MiniPosApp extends StatelessWidget {
  const MiniPosApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
        home: SafeArea(child: Scaffold(body: Text("MiNi POS app running"))));
  }
}
