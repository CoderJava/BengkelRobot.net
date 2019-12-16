import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  final double paddingScreen = 32.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          _buildWidgetHeader(context),
        ],
      ),
    );
  }

  Widget _buildWidgetHeader(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: paddingScreen, top: paddingScreen, right: paddingScreen, bottom: 16.0,),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'BengkelRobot',
            style: Theme.of(context).textTheme.display1.merge(TextStyle(color: Colors.grey[700])),
          ),
          Expanded(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                Text(
                  'Home',
                  style: Theme.of(context).textTheme.title.merge(TextStyle(color: Colors.orangeAccent, fontWeight: FontWeight.bold)),
                ),
                SizedBox(width: 48.0),
                Text(
                  'Archive',
                  style: Theme.of(context).textTheme.title.merge(TextStyle(color: Colors.black45, fontWeight: FontWeight.bold)),
                ),
                SizedBox(width: 48.0),
                Text(
                  'Category',
                  style: Theme.of(context).textTheme.title.merge(TextStyle(color: Colors.black45, fontWeight: FontWeight.bold)),
                ),
                SizedBox(width: 48.0),
                Text(
                  'Pages',
                  style: Theme.of(context).textTheme.title.merge(TextStyle(color: Colors.black45, fontWeight: FontWeight.bold)),
                ),
                SizedBox(width: 48.0),
                Text(
                  'Contact',
                  style: Theme.of(context).textTheme.title.merge(TextStyle(color: Colors.black45, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          Icon(
            FontAwesomeIcons.facebook,
            size: 20.0,
            color: Colors.grey[700],
          ),
          SizedBox(width: 12.0),
          Icon(
            FontAwesomeIcons.twitter,
            size: 20.0,
            color: Colors.grey[700],
          ),
          SizedBox(width: 12.0),
          Icon(
            FontAwesomeIcons.instagram,
            size: 20.0,
            color: Colors.grey[700],
          ),
        ],
      ),
    );
  }
}
