import 'package:json_annotation/json_annotation.dart';

part 'reddit_post_data.g.dart';

@JsonSerializable()
class RedditPostData {
  const RedditPostData({
    this.thumbnail = '',
    this.title = '',
    this.ups = 0,
    this.selftext = '',
  });
  final String thumbnail;
  final String title;
  final int ups;
  final String selftext;

  factory RedditPostData.fromJson(Map<String, dynamic> json) =>
      _$RedditPostDataFromJson(json);

  Map<String, dynamic> toJson() => _$RedditPostDataToJson(this);
}
