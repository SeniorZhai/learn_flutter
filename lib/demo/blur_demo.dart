import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class BlurDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Blur")),
        body: Container(
            color: Color(0xDF3B3F44),
            height: double.maxFinite,
            child: Stack(children: <Widget>[
              SizedBox(width: double.maxFinite),
              Positioned(
                  left: 125,
                  top: -30,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Color(0xFF895397),
                        borderRadius: BorderRadius.circular(50.0)),
                  )),
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                    color: Color(0xFFB26ABF),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(180.0),
                    )),
              ),
              Positioned(
                  top: 20,
                  left: 20,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(8)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: BackdropFilter(
                            filter: ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Container(
                              height: 200,
                              width: 300,
                              child: Center(
                                child: Text(
                                  "Hello,Flutter",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ))))
            ])));
  }
}
