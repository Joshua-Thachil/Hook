import 'package:flutter/material.dart';
import 'package:musicapp/Style/Palette.dart';

class ProfileCreation5 extends StatefulWidget {
  const ProfileCreation5({super.key});

  @override
  State<ProfileCreation5> createState() => _ProfileCreation5State();
}

class _ProfileCreation5State extends State<ProfileCreation5> {
  final Palette palette = Palette();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: palette.bg,
    );
  }
}
