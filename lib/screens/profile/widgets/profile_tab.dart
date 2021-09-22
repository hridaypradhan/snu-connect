import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileTab extends StatelessWidget {
  final String label;
  final Icon icon;
  const ProfileTab({
    Key? key,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Column(
        children: [
          icon,
          const SizedBox(height: 5.0),
          Text(
            label,
            style: GoogleFonts.spartan().copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
