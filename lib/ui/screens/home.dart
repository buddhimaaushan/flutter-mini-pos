import 'package:flutter/material.dart';
import 'package:mini_pos/ui/components/sidebar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Row(
      children: [
        Sidebar(),
        Text("MiNi POS app running"),
      ],
    ));
  }
}
