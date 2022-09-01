import 'package:finam_task/data/models/reddit_response_data/reddit_response_data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'reddit_response.g.dart';

@JsonSerializable()
class RedditResponse {
  const RedditResponse({
    required this.data,
  });
  final RedditResponseData data;

  factory RedditResponse.fromJson(Map<String, dynamic> json) =>
      _$RedditResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RedditResponseToJson(this);
}
