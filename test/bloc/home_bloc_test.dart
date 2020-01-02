import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:website_bengkel_robot/src/bloc/home_bloc.dart';
import 'package:website_bengkel_robot/src/model/latestpost/latest_post_response.dart';
import 'package:website_bengkel_robot/src/repository/medium_api_repository.dart';

class MockMediumApiRepository extends Mock implements MediumApiRepository {}

main() {
  group('HomeBloc', () {
    MockMediumApiRepository mediumApiRepository;
    HomeBloc homeBloc;

    setUp(() {
      mediumApiRepository = MockMediumApiRepository();
      homeBloc = HomeBloc(mediumApiRepository);
    });

    tearDown(() {
      homeBloc?.close();
    });

    test('has a correct initialState', () {
      expect(homeBloc.initialState, HomeInitial());
    });

    group('FetchLatestPost', () {
      test('emits [HomeInitial, HomeLoading, HomeSuccess] when medium api repository returns latest post', () {
        final jsonLatestPostResponse =
        '''{
            "articles": [
              {
                "banner": "https://bengkelrobot.net:8003/assets/images/img_content_sample_1.jpg",
                "title": "How to Find the Video Games of Your Youth",
                "datetime": 1576923710000,
                "comment": 3,
                "author": "Ditta Amelia",
                "author_photo": "http://bengkelrobot.net:8003/assets/images/img_sample_avatar_1.jpg"
              },
              {
                "banner": "https://bengkelrobot.net:8003/assets/images/img_content_sample_2.jpg",
                "title": "How to Find the Video Games of Your Youth",
                "datetime": 1576923710000,
                "comment": 3,
                "author": "Ditta Amelia",
                "author_photo": "http://bengkelrobot.net:8003/assets/images/img_sample_avatar_2.jpg"
              },
              {
                "banner": "https://bengkelrobot.net:8003/assets/images/img_content_sample_3.jpg",
                "title": "How to Find the Video Games of Your Youth",
                "datetime": 1576923710000,
                "comment": 3,
                "author": "Yudi Setiawan",
                "author_photo": "http://bengkelrobot.net:8003/assets/images/img_sample_avatar_3.jpg"
              },
              {
                "banner": "https://bengkelrobot.net:8003/assets/images/img_content_sample_4.jpg",
                "title": "How to Find the Video Games of Your Youth",
                "datetime": 1576923710000,
                "comment": 3,
                "author": "Angelica Agnesia",
                "author_photo": "http://bengkelrobot.net:8003/assets/images/img_sample_avatar_4.jpg"
              },
              {
                "banner": "https://bengkelrobot.net:8003/assets/images/img_content_sample_5.jpg",
                "title": "How to Find the Video Games of Your Youth",
                "datetime": 1576923710000,
                "comment": 3,
                "author": "Ditta Amelia",
                "author_photo": "http://bengkelrobot.net:8003/assets/images/img_sample_avatar_1.jpg"
              },
              {
                "banner": "https://bengkelrobot.net:8003/assets/images/img_content_sample_6.jpg",
                "title": "How to Find the Video Games of Your Youth",
                "datetime": 1576923710000,
                "comment": 3,
                "author": "Ditta Amelia",
                "author_photo": "http://bengkelrobot.net:8003/assets/images/img_sample_avatar_2.jpg"
              }
            ]
          }''';
        final LatestPostResponse latestPostResponse = LatestPostResponse.fromJson(json.decode(jsonLatestPostResponse));
        when(mediumApiRepository.fetchLatestPost()).thenAnswer((_) => Future.value(latestPostResponse));
        expectLater(homeBloc, emitsInOrder([HomeInitial(), HomeLoading(), HomeSuccess(latestPostResponse)]));
        homeBloc.add(HomeLoadData());
      });

      test('emits [HomeInitial, HomeLoading, HomeError] when medium api repository throws error', () {
        String errorMessage = 'Error occured when fetching latest post';
        when(mediumApiRepository.fetchLatestPost()).thenThrow(errorMessage);
        expectLater(homeBloc, emitsInOrder([HomeInitial(), HomeLoading(), HomeFailure(errorMessage)]));
        homeBloc.add(HomeLoadData());
      });

      test('emits [HomeInitial, HomeLoading, HomeError] when medium api repository response error', () {
        String errorMessage = 'Bad Request';
        when(mediumApiRepository.fetchLatestPost()).thenAnswer((_) => Future.value(LatestPostResponse.withError(errorMessage)));
        expectLater(homeBloc, emitsInOrder([HomeInitial(), HomeLoading(), HomeFailure(errorMessage)]));
        homeBloc.add(HomeLoadData());
      });
    });

  });
}