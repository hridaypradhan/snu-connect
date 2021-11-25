import 'package:flutter/material.dart';
import 'package:snu_connect/global/constants/colors.dart';

SnackBar alertPopup(String text) => SnackBar(
      dismissDirection: DismissDirection.horizontal,
      backgroundColor: lightPink,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20.0,
      ),
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: primaryPink,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
