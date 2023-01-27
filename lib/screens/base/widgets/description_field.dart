import 'package:flutter/material.dart';

import '../../../global/constants/colors.dart';

class DescriptionField extends StatelessWidget {
  final TextEditingController? controller;
  const DescriptionField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      textAlignVertical: TextAlignVertical.center,
      controller: controller,
      decoration: InputDecoration(
        hintMaxLines: 3,
        suffixIcon: const Icon(
          Icons.text_format,
          color: primaryPink,
        ),
        counterText: '',
        contentPadding: const EdgeInsets.all(18.0),
        labelText: 'Description',
        labelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18.0,
        ),
        hintText:
            'Ex. What you\'ll be doing, what to bring or any other details.',
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
