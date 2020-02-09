import 'package:flutter/cupertino.dart';

class WidgetEmptySizedBox extends StatelessWidget {
  final double width;
  final double height;

  WidgetEmptySizedBox({this.width = 0, this.height = 0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
