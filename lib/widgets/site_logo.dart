import 'package:flutter/material.dart';
import '../constants/colors.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({super.key,this.onTap,});
   final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: const Text(
        "<-HHS->",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          decoration: TextDecoration.none,
          color: CustomColor.yellowSecondary,

        ),
      ),
    );
  }
}
