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
class NextButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const NextButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff90DAB9),
        fixedSize: const Size(125, 50),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Icon(
            icon,
            color: Colors.black,
            size: 30,
          ),
        ],
      ),
    );
  }
}

