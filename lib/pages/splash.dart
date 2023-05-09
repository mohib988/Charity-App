import "dart:async";
import "dart:io";
import "package:flutter/material.dart";
import "package:flutter_application_1/AppTheme/app_theme.dart";
import "package:flutter_application_1/main.dart";
import "package:flutter_application_1/pages/login.dart";
import "package:flutter_application_1/pages/org_signup_page.dart";
import "package:flutter_application_1/pages/signup_page.dart";
import "package:flutter_application_1/urls/urls.dart";

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => OrganizationSignupPage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/logo.png',
              height: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            const CircularProgressIndicator(
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
