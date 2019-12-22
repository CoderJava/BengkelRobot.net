import 'package:json_annotation/json_annotation.dart';

part 'latest_post_response.g.dart';

@JsonSerializable()
class LatestPostResponse {
  @JsonKey(name: 'articles')
  List<ItemPost> posts;
  @JsonKey(ignore: true)
  String error;

  LatestPostResponse(this.posts);

  factory LatestPostResponse.fromJson(Map<String, dynamic> json) => _$LatestPostResponseFromJson(json);

  LatestPostResponse.withError(this.error);

  Map<String, dynamic> toJson() => _$LatestPostResponseToJson(this);

  @override
  String toString() {
    return 'LatestPostResponse{posts: $posts}';
  }
}

@JsonSerializable()
class ItemPost {
  String banner;
  String title;
  int datetime;
  int comment;
  String author;
  @JsonKey(name: 'author_photo')
  String authorPhoto;

  ItemPost(this.banner, this.title, this.datetime, this.comment, this.author, this.authorPhoto);

  factory ItemPost.fromJson(Map<String, dynamic> json) => _$ItemPostFromJson(json);

  Map<String, dynamic> toJson() => _$ItemPostToJson(this);

  @override
  String toString() {
    return 'ItemPost{banner: $banner, title: $title, datetime: $datetime, comment: $comment, author: $author, authorPhoto: $authorPhoto}';
  }
}
