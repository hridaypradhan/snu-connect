import 'package:flutter/material.dart';
import 'package:snu_connect/constants/colors.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  const PasswordField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _textVisible = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.center,
      obscureText: _textVisible,
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(18.0),
        suffixIcon: IconButton(
          icon: Icon(
            !_textVisible ? Icons.visibility : Icons.visibility_off,
            color: primaryPink,
          ),
          onPressed: () {
            setState(
              () {
                _textVisible = !_textVisible;
              },
            );
          },
        ),
        labelText: 'Password',
        labelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(
            width: 2.0,
            color: primaryPink,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
