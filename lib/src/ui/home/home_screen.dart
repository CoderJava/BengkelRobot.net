import 'dart:ui';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double widthScreen = mediaQueryData.size.width;
    double heightScreen = mediaQueryData.size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildWidgetBackground(widthScreen, heightScreen),
        ],
      ),
    );
  }

  Widget _buildWidgetBackground(double widthScreen, double heightScreen) {
    return Container(
      width: widthScreen,
      height: heightScreen,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/img_sample_1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          color: Colors.white.withOpacity(0.0),
        ),
      ),
    );
  }
}
