import 'package:finam_task/data/models/reddit_post/reddit_post.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reddit_response_data.g.dart';

@JsonSerializable()
class RedditResponseData {
  const RedditResponseData({
    required this.children,
    this.after = '',
  });
  final List<RedditPost> children;
  final String after;
  factory RedditResponseData.fromJson(Map<String, dynamic> json) =>
      _$RedditResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$RedditResponseDataToJson(this);
}
