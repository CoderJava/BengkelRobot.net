import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  final double paddingScreen = 32.0;
  final List<String> listImages = [
    'assets/images/img_content_sample_1.jpg',
    'assets/images/img_content_sample_2.jpg',
    'assets/images/img_content_sample_3.jpg',
    'assets/images/img_content_sample_4.jpg',
    'assets/images/img_content_sample_5.jpg',
    'assets/images/img_content_sample_6.jpg',
  ];
  double widthScreen;
  double heightScreen;
  int counterItemLatestPost = 0;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    widthScreen = mediaQueryData.size.width;
    heightScreen = mediaQueryData.size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          _buildWidgetWelcome(context),
          _buildWidgetSizedBox(height: paddingScreen),
          Padding(
            padding: EdgeInsets.only(left: paddingScreen + 16.0),
            child: Text(
              'Latest Post',
              style: Theme.of(context).textTheme.headline,
            ),
          ),
          _buildWidgetSizedBox(height: 16.0),
          GridView.count(
            padding: EdgeInsets.symmetric(horizontal: paddingScreen),
            shrinkWrap: true,
            crossAxisCount: 3,
            childAspectRatio: 1.0,
            children: List.generate(
              listImages.length,
              (index) {
                counterItemLatestPost += 1;
                if (counterItemLatestPost == 4) {
                  counterItemLatestPost = 1;
                }
                String image = listImages[index];
                return Padding(
                  padding: EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    bottom: paddingScreen,
                  ),
                  child: Card(
                    elevation: 4.0,
                    child: Column(
                      children: <Widget>[
                        _buildWidgetImageCoverItemPost(image),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              _buildWidgetCaptionItemPost(),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 16.0,
                                    top: 8.0,
                                    right: 16.0,
                                  ),
                                  child: Text(
                                    'How to Find the Video Games of Your Youth',
                                    style: Theme.of(context).textTheme.title,
                                    maxLines: 2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWidgetCaptionItemPost() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        top: 16.0,
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/img_sample_avatar_2.jpg'),
          ),
          _buildWidgetSizedBox(width: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Ditta Amelia',
                style: TextStyle(
                  color: Colors.grey[700],
                ),
                softWrap: true,
              ),
              Text(
                'December 18, 2019',
                style: TextStyle(color: Colors.grey[400]),
              ),
            ],
          ),
          Expanded(
            child: Wrap(
              alignment: WrapAlignment.end,
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.solidComments,
                  size: 18.0,
                  color: Colors.grey[400],
                ),
                _buildWidgetSizedBox(width: 8.0),
                Text(
                  '3',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                _buildWidgetSizedBox(width: 16.0),
              ],
            ),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }

  Widget _buildWidgetImageCoverItemPost(String image) {
    return Expanded(
      flex: 2,
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        width: widthScreen,
      ),
    );
  }

  Widget _buildWidgetWelcome(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/images/img_header.png',
          width: widthScreen,
          height: heightScreen / 1.5,
          fit: BoxFit.cover,
        ),
        Container(
          width: widthScreen,
          height: heightScreen / 1.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome to the BengkelRobot',
                style: Theme.of(context).textTheme.display3.merge(TextStyle(color: Colors.white)),
              ),
              _buildWidgetSizedBox(height: 28.0),
              Wrap(
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.facebook,
                    color: Colors.white,
                    size: 36.0,
                  ),
                  _buildWidgetSizedBox(width: 72.0),
                  Icon(
                    FontAwesomeIcons.twitter,
                    color: Colors.white,
                    size: 36.0,
                  ),
                  _buildWidgetSizedBox(width: 72.0),
                  Icon(
                    FontAwesomeIcons.github,
                    color: Colors.white,
                    size: 36.0,
                  ),
                  _buildWidgetSizedBox(width: 72.0),
                  Icon(
                    FontAwesomeIcons.instagram,
                    color: Colors.white,
                    size: 36.0,
                  ),
                  _buildWidgetSizedBox(width: 72.0),
                  Icon(
                    FontAwesomeIcons.medium,
                    color: Colors.white,
                    size: 36.0,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWidgetSizedBox({double width = 0, double height = 0}) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
