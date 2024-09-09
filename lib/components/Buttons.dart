import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.button_text,
  });

  final String button_text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));

      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: const Color(0xff90DAB9),
        fixedSize: const Size(366, 61.6),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
      ),
      child: Text(
        button_text,
        style: TextStyle(
          fontSize: 18.3,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
