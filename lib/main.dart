// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:stayhuman/stayhuman.dart';

// void main() {
//   runApp(
//     MyApp(),
//   );
//   SystemChrome.setEnabledSystemUIOverlays([]);
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(),
//       home: StayHuman(),
//     );
//   }
// }
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() {
    return new MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = Tween<double>(begin: 0, end: 100).animate(animationController);

    ////
    animation.addListener(() {
      setState(() {
        print(animation.value);
      });
    });
    animation.addStatusListener((status) => print(status));
    // animationController.forward();
    // animationController.reverse();

    ///
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () async {
              await animationController.forward();
              animationController.reverse();
            },
          ),
          RaisedButton(
            onPressed: () {
              animationController.reverse();
            },
          ),
          Container(
            height: 300,
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 30,
                  bottom: animation.value,
                  width: 100,
                  height: 100,
                  child: FlutterLogo(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
