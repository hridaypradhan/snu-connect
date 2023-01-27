import 'package:flutter/material.dart';

import '../../../global/constants/colors.dart';

class VenueField extends StatelessWidget {
  final TextEditingController? controller;
  const VenueField({
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
          Icons.location_on,
          color: primaryPink,
        ),
        counterText: '',
        contentPadding: const EdgeInsets.all(18.0),
        labelText: 'Venue',
        labelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18.0,
        ),
        hintText: 'Library, 506 1A, etc.',
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
