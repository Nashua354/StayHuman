import 'package:flutter/material.dart';

class StayHuman extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTapDown: (details) {
          print(details.globalPosition);
        },
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              height: 80,
              width: 80,
              left: 50,
              bottom: 90,
              child: Image.asset('assets/images/blob.png'),
            ),
            Positioned(
              bottom: 90,
              right: 50,
              height: 80,
              width: 80,
              child: Image.asset('assets/images/enemy.png'),
            )
          ],
        ),
      ),
    );
  }
}
