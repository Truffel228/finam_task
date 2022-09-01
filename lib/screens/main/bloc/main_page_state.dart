import 'package:finam_task/data/models/reddit_post/reddit_post.dart';

class MainPageState {
  const MainPageState({
    required this.loading,
    required this.redditPosts,
    required this.after,
  });

  factory MainPageState.initial() => const MainPageState(
        loading: true,
        redditPosts: [],
        after: '',
      );

  final bool loading;
  final List<RedditPost> redditPosts;
  final String after;

  MainPageState copyWith({
    bool? loading,
    List<RedditPost>? redditPosts,
    String? after,
  }) =>
      MainPageState(
        loading: loading ?? this.loading,
        redditPosts: redditPosts ?? this.redditPosts,
        after: after ?? this.after,
      );
}
