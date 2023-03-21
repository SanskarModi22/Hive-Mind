import 'package:flutter/material.dart';
import '../../../core/common/sign_in_button.dart';
import '../../../core/constants/constants.dart';
import '../../../widgets/custom_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // logo on appbar
      appBar: AppBar(
        title: Image.asset(
          Constants.logoPath,
          height: 40,
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const CustomText(
              text: "Skip",
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const CustomText(
              text: "Dive into anything",
              color: Colors.white,
              fontSize: 24.0,
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                Constants.loginEmotePath,
                height: 400,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SignInButton()
          ],
        ),
      ),
    );
  }
}
