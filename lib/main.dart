import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mini_pos/ui/screens/home.dart';

void main() {
  runApp(const MiniPosApp());
}

class MiniPosApp extends StatelessWidget {
  const MiniPosApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const SafeArea(child: Home()),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.trackpad,
          PointerDeviceKind.invertedStylus
        },
      ),
    );
  }
}
