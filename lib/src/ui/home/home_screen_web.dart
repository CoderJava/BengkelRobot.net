import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website_bengkel_robot/src/bloc/home_bloc.dart';
import 'package:website_bengkel_robot/src/extension/hover_extensions.dart';
import 'package:website_bengkel_robot/src/model/latestpost/latest_post_response.dart';
import 'package:website_bengkel_robot/src/repository/medium_api_repository.dart';

class HomeScreenWeb extends StatefulWidget {
  @override
  _HomeScreenWebState createState() => _HomeScreenWebState();
}

class _HomeScreenWebState extends State<HomeScreenWeb> {
  final HomeBloc _homeBloc = HomeBloc(MediumApiRepository());
  final double paddingScreen = 32.0;
  double widthScreen;
  double heightScreen;

  @override
  void initState() {
    _homeBloc.add(HomeLoadData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    widthScreen = mediaQueryData.size.width;
    heightScreen = mediaQueryData.size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<HomeBloc>(
        create: (context) => _homeBloc,
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (state is HomeLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeFailure) {
            return Center(
              child: Text('Oops... something went wrong: ${state.errorMessage}'),
            );
          } else if (state is HomeSuccess) {
            return _buildWidgetListContent(context, state.latestPostResponse);
          } else {
            return Container();
          }
        }),
      ),
    );
  }

  Widget _buildWidgetListContent(BuildContext context, LatestPostResponse latestPostResponse) {
    return ListView(
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
          children: List.generate(
            latestPostResponse.posts.length,
            (index) {
              ItemPost itemPost = latestPostResponse.posts[index];
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
                      _buildWidgetImageCoverItemPost(itemPost.banner),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _buildWidgetCaptionItemPost(itemPost),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 16.0,
                                  top: 8.0,
                                  right: 16.0,
                                ),
                                child: Text(
                                  itemPost.title,
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
    );
  }

  Widget _buildWidgetCaptionItemPost(ItemPost itemPost) {
    DateTime dateTimePost = DateTime.fromMillisecondsSinceEpoch(itemPost.datetime);
    String formattedDateTimePost = DateFormat('MMMM dd, yyyy').format(dateTimePost);

    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        top: 16.0,
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(itemPost.authorPhoto),
          ),
          _buildWidgetSizedBox(width: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                itemPost.author,
                style: TextStyle(
                  color: Colors.grey[700],
                ),
                softWrap: true,
              ),
              Text(
                formattedDateTimePost,
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
                  '${itemPost.comment}',
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
      child: Image.network(
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
                  _buildWidgetIconSocialMedia(FontAwesomeIcons.facebookF, Colors.white, 36.0, 'https://www.facebook.com/kolonel.yudisetiawan'),
                  _buildWidgetSizedBox(width: 72.0),
                  _buildWidgetIconSocialMedia(FontAwesomeIcons.twitter, Colors.white, 36.0, 'https://www.twitter.com/CoderKotlin'),
                  _buildWidgetSizedBox(width: 72.0),
                  _buildWidgetIconSocialMedia(FontAwesomeIcons.github, Colors.white, 36.0, 'https://github.com/coderjava'),
                  _buildWidgetSizedBox(width: 72.0),
                  _buildWidgetIconSocialMedia(FontAwesomeIcons.mediumM, Colors.white, 36.0, 'https://medium.com/@kolonel.yudisetiawan'),
                  _buildWidgetSizedBox(width: 72.0),
                  _buildWidgetIconSocialMedia(
                      FontAwesomeIcons.linkedinIn, Colors.white, 36.0, 'https://www.linkedin.com/in/yudi-setiawan-179401131/'),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWidgetIconSocialMedia(IconData icon, Color color, double size, String url) {
    return GestureDetector(
      onTap: () async {
        await launch(url);
      },
      child: Icon(
        icon,
        color: color,
        size: size,
      ).showCursorOnHover.moveUnOnHover,
    );
  }

  Widget _buildWidgetSizedBox({double width = 0, double height = 0}) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
