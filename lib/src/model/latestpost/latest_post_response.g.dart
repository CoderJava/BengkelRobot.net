// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatestPostResponse _$LatestPostResponseFromJson(Map<String, dynamic> json) {
  return LatestPostResponse(
    (json['articles'] as List)
        ?.map((e) =>
            e == null ? null : ItemPost.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$LatestPostResponseToJson(LatestPostResponse instance) =>
    <String, dynamic>{
      'articles': instance.posts,
    };

ItemPost _$ItemPostFromJson(Map<String, dynamic> json) {
  return ItemPost(
    json['banner'] as String,
    json['title'] as String,
    json['datetime'] as int,
    json['comment'] as int,
    json['author'] as String,
    json['author_photo'] as String,
  );
}

Map<String, dynamic> _$ItemPostToJson(ItemPost instance) => <String, dynamic>{
      'banner': instance.banner,
      'title': instance.title,
      'datetime': instance.datetime,
      'comment': instance.comment,
      'author': instance.author,
      'author_photo': instance.authorPhoto,
    };
