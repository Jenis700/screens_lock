import 'package:flutter/material.dart';
import 'package:lock_app/password%20Lock/chek_pass.dart';
import 'package:lock_app/password%20Lock/set_pass.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SetPassword(),
              SizedBox(height: 20),
              CheckPassword(),
            ],
          ),
        ),
      ),
    );
  }
}
