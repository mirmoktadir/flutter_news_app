import 'dart:async';

import 'package:flutter/material.dart';

import 'home_screen.dart';

class LoadingScreen extends StatefulWidget {
  static const String id = 'LoadingScreen';

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, HomeScreen.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          height: 100,
          child: Container(
            child: Center(
              child: Column(
                children: [
                  Text(
                    'WSJ',
                    style: TextStyle(
                      color: Colors.red[400],
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  Text(
                    'dev: moktadir',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      // letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
