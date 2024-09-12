import "package:flutter/material.dart";

class InputField extends StatelessWidget { // Basic Small Input Text Field
  const InputField({
    super.key,
    required this.InputController,
    required this.hint,
    required this.height
  });

  final TextEditingController InputController;
  final String hint;
  final int height;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: height,
      minLines: height,
      controller: InputController,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
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
