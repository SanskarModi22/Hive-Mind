import 'package:flutter/material.dart';

import '../../theme/pallete.dart';
import '../../widgets/custom_text.dart';
import '../constants/constants.dart';

class SignInButton extends StatefulWidget {
  const SignInButton({super.key});

  @override
  State<SignInButton> createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: ElevatedButton.icon(
        label: const CustomText(
          text: "Login with google",
          fontSize: 18.0,
        ),
        icon: Image.asset(
          Constants.googlePath,
          width: 35,
        ),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: Palette.greyColor,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
