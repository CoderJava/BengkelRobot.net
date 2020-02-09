import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:website_bengkel_robot/src/widget/widgets.dart';

class HomeScreen extends StatelessWidget {
  final String _fontFamilyLatoThin = 'Lato-Thin';
  final String _fontFamilyLatoRegular = 'Lato-Regular';

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double widthScreen = mediaQueryData.size.width;
    double heightScreen = mediaQueryData.size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildWidgetBackground(widthScreen, heightScreen),
          WidgetNavBar(widthScreen, kToolbarHeight, 'Home'),
          _buildWidgetContent(widthScreen),
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
          image: AssetImage('assets/images/img_sample_1.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildWidgetContent(double widthScreen) {
    return Container(
      width: widthScreen,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildWidgetDottedLine(widthScreen),
          WidgetEmptySizedBox(height: 16.0),
          Text(
            'Yudi Setiawan',
            style: TextStyle(color: Colors.white, fontSize: 72.0, fontFamily: _fontFamilyLatoRegular),
          ),
          Text(
            'Mobile Software Engineer',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: _fontFamilyLatoThin,
            ),
          ),
          WidgetEmptySizedBox(height: 32.0),
          _buildWidgetDottedLine(widthScreen),
        ],
      ),
    );
  }

  Widget _buildWidgetDottedLine(double widthScreen) {
    return SizedBox(
      width: widthScreen / 2,
      child: WidgetDottedLine(
        width: 3,
        color: Colors.white,
      ),
    );
  }
}
