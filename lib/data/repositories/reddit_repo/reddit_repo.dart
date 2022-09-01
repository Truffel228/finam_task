import 'package:finam_task/data/models/reddit_response/reddit_response.dart';
import 'package:finam_task/data/repositories/reddit_repo/reddit_repo_interface.dart';
import 'package:finam_task/data/services/reddit_service/reddit_service_interface.dart';

class RedditRepo implements RedditRepoInterface {
  const RedditRepo(this._redditService);
  final RedditServiceInterface _redditService;
  @override
  Future<RedditResponse> getRedditPosts() {
    return _redditService.getRedditPosts();
  }
}
