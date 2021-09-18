import 'package:flutter/material.dart';
import 'package:snu_connect/global/constants/colors.dart';

class EventNameField extends StatelessWidget {
  final TextEditingController? controller;
  const EventNameField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textCapitalization: TextCapitalization.words,
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.center,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: const Icon(
          Icons.text_fields,
          color: primaryPink,
        ),
        counterText: '',
        contentPadding: const EdgeInsets.all(18.0),
        labelText: 'Event Name',
        labelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18.0,
        ),
        hintText: 'Ex. Football Game',
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
