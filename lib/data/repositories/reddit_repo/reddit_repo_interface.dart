import 'package:finam_task/data/models/reddit_response/reddit_response.dart';

abstract class RedditRepoInterface {
  Future<RedditResponse> getRedditPosts();
}
