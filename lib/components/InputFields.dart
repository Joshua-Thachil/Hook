import "package:flutter/material.dart";

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.InputController,
    required this.hint
  });

  final TextEditingController InputController;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: InputController,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        hintText: "email",
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 18.3,
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        fillColor: Color(0xff1E1E1E),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
      ),
    );
  }
}
