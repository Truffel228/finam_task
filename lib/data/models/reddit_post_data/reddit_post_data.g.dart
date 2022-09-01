// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reddit_post_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RedditPostData _$RedditPostDataFromJson(Map<String, dynamic> json) =>
    RedditPostData(
      thumbnail: json['thumbnail'] as String? ?? '',
      title: json['title'] as String? ?? '',
      ups: json['ups'] as int? ?? 0,
      selftext: json['selftext'] as String? ?? '',
    );

Map<String, dynamic> _$RedditPostDataToJson(RedditPostData instance) =>
    <String, dynamic>{
      'thumbnail': instance.thumbnail,
      'title': instance.title,
      'ups': instance.ups,
      'selftext': instance.selftext,
    };
