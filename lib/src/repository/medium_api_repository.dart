import 'package:website_bengkel_robot/src/model/latestpost/latest_post_response.dart';
import 'package:website_bengkel_robot/src/repository/medium_api_client.dart';

class MediumApiRepository {
  final MediumApiClient _mediumApiClient = MediumApiClient();

  Future<LatestPostResponse> fetchLatestPost() => _mediumApiClient.getLatestPostResponse();
}
