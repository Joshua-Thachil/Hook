import "package:flutter/material.dart";

class InputField extends StatelessWidget { // Basic Small Input Text Field
  const InputField({
    super.key,
    required this.InputController,
    required this.hint,
    required this.height,
    this.suffix,
    this.searchFocusNode,
    this.onSubmitted,
    this.onChanged,
  });

  final TextEditingController InputController;
  final String hint;
  final int height;
  final IconButton? suffix;
  final FocusNode? searchFocusNode;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: searchFocusNode,
      maxLines: height,
      minLines: height,
      controller: InputController,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.grey,
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
        suffixIcon: suffix,
      ),
      onSubmitted: onSubmitted,
      onChanged: onChanged,
    );
  }
}
