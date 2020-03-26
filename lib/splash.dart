import 'dart:async';

import 'package:covid_19/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

    Future gotoHome() async {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
  }

  
 @override
  void initState() {
    super.initState();
    new Timer(new Duration(seconds:10), () {
      gotoHome();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Colors.grey[500],
                Colors.grey[600],
                Colors.grey[700],
                Colors.grey[800],
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 600,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/img1.png',
                                ),
                                height: 200.0,
                                width: 200.0,
                              ),
                            ),
                            Center(
                              child: Text(
                                'Covid-19',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  'The COVID-19 is an undiscovered strain of the coronavirus family. Currently, the virus has a few epicenters in China, South Korea and Italy, but cases are being reported in different countries. Authorities are taking measures to prevent the spread of the COVID-19 and develop a vaccine; Until then, the best form of protection is to avoid any infected areas or people.',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                           
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
