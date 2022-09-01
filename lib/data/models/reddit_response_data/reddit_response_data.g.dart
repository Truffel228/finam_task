// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reddit_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RedditResponseData _$RedditResponseDataFromJson(Map<String, dynamic> json) =>
    RedditResponseData(
      children: (json['children'] as List<dynamic>)
          .map((e) => RedditPost.fromJson(e as Map<String, dynamic>))
          .toList(),
      after: json['after'] as String? ?? '',
    );

Map<String, dynamic> _$RedditResponseDataToJson(RedditResponseData instance) =>
    <String, dynamic>{
      'children': instance.children,
      'after': instance.after,
    };
