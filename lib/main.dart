import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/Screens/first_page.dart';
import 'package:sizer/sizer.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return LayoutBuilder(
      //return LayoutBuilder
      builder: (context, constraints) {
        return OrientationBuilder(
          //return OrientationBuilder
          builder: (context, orientation) {
            //initialize SizerUtil()
            SizerUtil().init(constraints, orientation); //initialize SizerUtil
            return MaterialApp(
                color: Colors.white,
                debugShowCheckedModeBanner: false,
                title: 'Weather_App',
                theme: ThemeData.light(),
                home: weather());
          },
        );
      },
    );
  }
}

class weather extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return weather_test();
  }
}

class weather_test extends State<weather> {
  @override
  // initState() {
  //   super.initState();
  //   Timer(
  //       Duration(seconds: 4),
  //       () => Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => Search())));
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedSplashScreen(
      splashTransition: SplashTransition.slideTransition,
      backgroundColor: Colors.blueAccent,
      splash: Container(
        child: Image(
          image: AssetImage("assets/chirok.png"),
          fit: BoxFit.fill,
        ),
      ),
      nextScreen: Search(),
    );
    // return Stack(
    //   children: [
    //     Positioned.fill(
    //       child: Container(
    //         color: Colors.white,
    //         child: Image(
    //           image: AssetImage('assets/cloud.png'),
    //           fit: BoxFit.fill,
    //         ),
    //       ),
    //     ),
    //     Positioned(
    //         child: Center(
    //       child: Container(
    //         height: 100,
    //         width: 100,
    //         child: Image(
    //           image: AssetImage('assets/chirok.png'),
    //           fit: BoxFit.fill,
    //         ),
    //       ),
    //     )),
    //     Positioned(
    //         bottom: 40.0.h,
    //         left: 30.0.w,
    //         child: Text(
    //           "Achraf karkaih app",
    //           style: TextStyle(
    //               color: Colors.redAccent,
    //               fontSize: 15,
    //               decoration: TextDecoration.none),
    //         )),
    //     Positioned(
    //         bottom: 33.0.h,
    //         left: 45.0.w,
    //         child: SpinKitPouringHourglass(
    //           color: Colors.red,
    //           size: 40,
    //         )),
    //   ],
    // );
  }
}

enum PageTransitionType {
  fade,
  rightToLeft,
  leftToRight,
  upToDown,
  downToUp,
  scale,
  rotate,
  size,
  rightToLeftWithFade,
  leftToRightWithFade,
}
