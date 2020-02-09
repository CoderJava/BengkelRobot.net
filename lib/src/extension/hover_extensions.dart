// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:website_bengkel_robot/src/widget/widgets.dart';

extension HoverExtensions on Widget {
  static final appContainer = html.window.document.getElementById('app-container');

  Widget get showCursorOnHover {
    return MouseRegion(
      child: this,
      onHover: (event) {
        appContainer.style.cursor = 'pointer';
      },
      onExit: (event) {
        appContainer.style.cursor = 'default';
      },
    );
  }

  Widget get moveUnOnHover {
    return TranslateOnHover(
      child: this,
    );
  }

  Widget get backgroundColorUnOnHover {
    return BackgroundColorOnHover(
      child: this,
    );
  }
}