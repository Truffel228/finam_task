import 'package:dio/dio.dart';
import 'package:finam_task/data/models/reddit_response/reddit_response.dart';
import 'package:finam_task/data/services/reddit_service/reddit_service_interface.dart';

class RedditService implements RedditServiceInterface {
  const RedditService(this._dio);
  final Dio _dio;

  @override
  Future<RedditResponse> getRedditPosts() async {
    final Response response = await _dio.get('/r/flutterdev/new.json');
    final RedditResponse redditResponse =
        RedditResponse.fromJson(response.data as Map<String, dynamic>);
    return redditResponse;
  }
}
