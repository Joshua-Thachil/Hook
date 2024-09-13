import 'package:flutter/material.dart';
import 'package:musicapp/Style/Palette.dart';

class Profilecreation4 extends StatefulWidget {
  const Profilecreation4({super.key});

  @override
  State<Profilecreation4> createState() => _Profilecreation4State();
}

class _Profilecreation4State extends State<Profilecreation4> {
  final Palette palette = Palette();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: palette.bg,
    );
  }
}
