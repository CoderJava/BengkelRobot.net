import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BackgroundColorOnHover extends StatefulWidget {
  final Widget child;

  BackgroundColorOnHover({Key key, this.child}) : super(key: key);

  @override
  _BackgroundColorOnHoverState createState() => _BackgroundColorOnHoverState();
}

class _BackgroundColorOnHoverState extends State<BackgroundColorOnHover> {
  final nonHoverBackgroundColor = null;
  final hoverBackgroundColor = Colors.black.withOpacity(0.6);

  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (PointerEnterEvent event) => _mouseEnter(true),
      onExit: (PointerExitEvent event) => _mouseEnter(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: widget.child,
        color: _isHovering ? hoverBackgroundColor : nonHoverBackgroundColor,
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _isHovering = hover;
    });
  }
}
