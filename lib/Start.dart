import 'dart:ui';

import 'package:findjobs/widgets/original_button.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(),
              Image.asset('assets/images/logo.png'),
              OriginalButton(
                text: 'Mulai',
                onPressed: () => Navigator.of(context).pushNamed('login'),
                textColor: Colors.lightBlue,
                bgColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
