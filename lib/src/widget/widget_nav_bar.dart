import 'package:flutter/material.dart';
import 'package:website_bengkel_robot/src/extension/extensions.dart';

class WidgetNavBar extends StatelessWidget {
  final double widthScreen;
  final double appBarHeight;
  final String activeMenu;

  final String _fontFamilyLatoThin = 'Lato-Thin';
  final List<String> menus = ['Home', 'About', 'Portfolio', 'Contact'];

  WidgetNavBar(this.widthScreen, this.appBarHeight, this.activeMenu);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthScreen,
      height: appBarHeight,
      padding: const EdgeInsets.symmetric(horizontal: 92.0),
      color: Colors.black.withOpacity(0.6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              Text(
                'BengkelRobot.net',
                style: Theme.of(context).textTheme.headline6.merge(
                      TextStyle(
                        color: Colors.white,
                        fontFamily: _fontFamilyLatoThin,
                        fontSize: 24.0,
                      ),
                    ),
              ),
            ],
          ),
          Wrap(
            alignment: WrapAlignment.center,
            children: <Widget>[
              for (int index = 0; index < menus.length; index++) _buildMenu(context, menus[index]),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMenu(BuildContext context, final String title) {
    return GestureDetector(
      onTap: () {
        if (title == menus[0]) {
          // TODO: menuju home page
        } else if (title == menus[1]) {
          // TODO: menuju about page
        } else if (title == menus[2]) {
          // TODO: menuju portfolio page
        } else if (title == menus[3]){
          // TODO: menuju contact page
        }
      },
      child: Container(
        height: appBarHeight,
        color: activeMenu == title ? Colors.black.withOpacity(0.6) : null,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: Theme.of(context).textTheme.headline6.merge(
                    TextStyle(
                      color: Colors.white,
                      fontFamily: _fontFamilyLatoThin,
                    ),
                  ),
            ),
          ],
        ),
      ),
    ).showCursorOnHover;
  }
}
