import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:website_bengkel_robot/src/extension/hover_extensions.dart';

class HomeScreen extends StatelessWidget {
  final String fontFamilyLatoThin = 'Lato-Thin';
  final String fontFamilyLatoRegular = 'Lato-Regular';

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double widthScreen = mediaQueryData.size.width;
    double heightScreen = mediaQueryData.size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildWidgetBackground(widthScreen, heightScreen),
          _buildWidgetNavBar(context, widthScreen),
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

  Widget _buildWidgetNavBar(BuildContext context, double widthScreen) {
    return Container(
      width: widthScreen,
      height: kToolbarHeight,
      color: Colors.black.withOpacity(0.6),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                Text(
                  'BengkelRobot.net',
                  style: Theme.of(context).textTheme.title.merge(
                        TextStyle(
                          color: Colors.white,
                          fontFamily: fontFamilyLatoThin,
                          fontSize: 24.0,
                        ),
                      ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(''),
          ),
          Expanded(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    // TODO: do something in here
                  },
                  child: Container(
                    height: kToolbarHeight,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Home',
                          style: Theme.of(context).textTheme.title.merge(
                                TextStyle(
                                  color: Colors.white,
                                  fontFamily: fontFamilyLatoThin,
                                ),
                              ),
                        ),
                      ],
                    ),
                  ),
                ).showCursorOnHover.backgroundColorUnOnHover,
                GestureDetector(
                  onTap: () {
                    // TODO: do something in here
                  },
                  child: Container(
                    height: kToolbarHeight,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'About',
                          style: Theme.of(context).textTheme.title.merge(
                                TextStyle(
                                  color: Colors.white,
                                  fontFamily: fontFamilyLatoThin,
                                ),
                              ),
                        ),
                      ],
                    ),
                  ),
                ).showCursorOnHover.backgroundColorUnOnHover,
                GestureDetector(
                  onTap: () {
                    // TODO: do something in here
                  },
                  child: Container(
                    height: kToolbarHeight,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Portfolio',
                          style: Theme.of(context).textTheme.title.merge(
                                TextStyle(
                                  color: Colors.white,
                                  fontFamily: fontFamilyLatoThin,
                                ),
                              ),
                        ),
                      ],
                    ),
                  ),
                ).showCursorOnHover.backgroundColorUnOnHover,
                GestureDetector(
                  onTap: () {
                    // TODO: do something in here
                  },
                  child: Container(
                    height: kToolbarHeight,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Contact',
                          style: Theme.of(context).textTheme.title.merge(
                                TextStyle(
                                  color: Colors.white,
                                  fontFamily: fontFamilyLatoThin,
                                ),
                              ),
                        ),
                      ],
                    ),
                  ),
                ).showCursorOnHover.backgroundColorUnOnHover,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
