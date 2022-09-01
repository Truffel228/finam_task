import 'package:finam_task/data/models/reddit_post_data/reddit_post_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reddit_post.g.dart';

@JsonSerializable()
class RedditPost {
  const RedditPost({
    required this.data,
  });
  final RedditPostData data;

  factory RedditPost.fromJson(Map<String, dynamic> json) =>
      _$RedditPostFromJson(json);

  Map<String, dynamic> toJson() => _$RedditPostToJson(this);
}
