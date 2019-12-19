import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:website_bengkel_robot/src/ui/home/home_screen_web.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.Mobile) {
          return Scaffold(
            body: Container(
              child: Center(
                child: Text('Coming soon for Device Mobile'),
              ),
            ),
          );
        } else if (sizingInformation.deviceScreenType == DeviceScreenType.Desktop) {
          return HomeScreenWeb();
        } else if (sizingInformation.deviceScreenType == DeviceScreenType.Tablet) {
          return Scaffold(
            body: Container(
              child: Center(
                child: Text('Coming soon for Device Tablet'),
              ),
            ),
          );
        } else if (sizingInformation.deviceScreenType == DeviceScreenType.Watch) {
          return Scaffold(
            body: Container(
              child: Center(
                child: Text('Coming soon for Device Watch'),
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Container(
              child: Center(
                child: Text('Unknown device type'),
              ),
            ),
          );
        }
      },
    );
  }
}
