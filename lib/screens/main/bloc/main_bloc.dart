import 'package:bloc/bloc.dart';
import 'package:finam_task/data/models/reddit_post/reddit_post.dart';
import 'package:finam_task/data/models/reddit_response/reddit_response.dart';
import 'package:finam_task/data/repositories/reddit_repo/reddit_repo_interface.dart';
import 'package:finam_task/screens/main/bloc/main_page_state.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc({required RedditRepoInterface redditRepo})
      : _redditRepo = redditRepo,
        super(
          MainState(
            MainPageState.initial(),
          ),
        ) {
    on<MainFetchEvent>(onMainFetchEvent);
    on<MainRefreshEvent>(onMainRefreshEvent);
    on<MainErrorEvent>(onMainErrorEvent);
  }

  final RedditRepoInterface _redditRepo;

  void onMainFetchEvent(MainFetchEvent event, emit) async {
    final RedditResponse redditPost = await _redditRepo.getRedditPosts();
    emit(
      MainState(
        state.mainPageState.copyWith(
          loading: false,
          redditPosts: redditPost.data.children,
          after: redditPost.data.after,
        ),
      ),
    );
  }

  void onMainRefreshEvent(MainRefreshEvent event, emit) async {
    emit(
      MainState(
        state.mainPageState.copyWith(loading: true),
      ),
    );
    final RedditResponse newRedditResponse = await _redditRepo.getRedditPosts();

    if (state.mainPageState.after != newRedditResponse.data.after) {
      ///Если поля after (является id следующей страницы, поэтому для разных ответов с сервера уникален)
      ///текущего и нового ответа отличаются, то добавляем в начало списка постов новые посты
      final List<RedditPost> refreshedRedditPosts =
          newRedditResponse.data.children + state.mainPageState.redditPosts;

      emit(
        MainState(
          state.mainPageState.copyWith(
            loading: false,
            redditPosts: refreshedRedditPosts,
            after: newRedditResponse.data.after,
          ),
        ),
      );
    } else {
      emit(
        MainState(
          state.mainPageState.copyWith(
            loading: false,
            redditPosts: newRedditResponse.data.children,
          ),
        ),
      );
    }
  }

  void onMainErrorEvent(event, emit) {
    emit(
      MainErrorState(state.mainPageState),
    );
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(
      MainErrorEvent(),
    );
    super.onError(error, stackTrace);
  }
}
